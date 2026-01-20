import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../utils/local_storage_service.dart';
import '../constants/app_config.dart';

/// Token Interceptor for handling authentication and token refresh
class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Token is already added in launchDio, but we can add additional logic here
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Handle 401 Unauthorized - Try to refresh token
    if (err.response?.statusCode == 401) {
      try {
        final refreshed = await _refreshToken();
        if (refreshed) {
          // Retry the original request with new token
          final retryResponse = await _retryRequest(err.requestOptions);
          return handler.resolve(retryResponse);
        }
      } catch (e) {
        print('❌ Token refresh error: $e');
      }
    }
    handler.next(err);
  }

  Future<bool> _refreshToken() async {
    try {
      final localStorage = GetIt.instance<LocalStorageService>();
      final appConfig = GetIt.instance<AppConfig>();
      final refreshToken = localStorage.refreshToken;

      if (refreshToken == null || refreshToken.isEmpty) {
        print('❌ No refresh token available');
        return false;
      }

      // Create a new Dio instance without interceptors to avoid infinite loop
      final refreshDio = Dio(
        BaseOptions(
          baseUrl: appConfig.baseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );

      print('🔄 Attempting to refresh token...');

      final response = await refreshDio.post(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;

        // Extract tokens from response
        String? newAccessToken;
        String? newRefreshToken;

        if (data is Map<String, dynamic>) {
          // Handle different response structures
          if (data.containsKey('data')) {
            final tokenData = data['data'];
            if (tokenData is Map<String, dynamic>) {
              newAccessToken =
                  tokenData['accessToken'] ??
                  tokenData['access_token'] ??
                  tokenData['token'];
              newRefreshToken =
                  tokenData['refreshToken'] ?? tokenData['refresh_token'];
            }
          } else {
            newAccessToken =
                data['accessToken'] ?? data['access_token'] ?? data['token'];
            newRefreshToken = data['refreshToken'] ?? data['refresh_token'];
          }
        }

        if (newAccessToken != null) {
          localStorage.accessToken = newAccessToken;
          if (newRefreshToken != null) {
            localStorage.refreshToken = newRefreshToken;
          }
          print('✅ Token refreshed successfully');
          return true;
        }
      }

      print('❌ Token refresh failed - invalid response');
      return false;
    } catch (e) {
      print('❌ Token refresh failed: $e');
      // Clear tokens on refresh failure
      try {
        final localStorage = GetIt.instance<LocalStorageService>();
        await localStorage.clearTokens();
      } catch (_) {}
      return false;
    }
  }

  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final localStorage = GetIt.instance<LocalStorageService>();
    final appConfig = GetIt.instance<AppConfig>();
    final newAccessToken = localStorage.accessToken;

    final retryDio = Dio(
      BaseOptions(
        baseUrl: appConfig.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $newAccessToken',
        },
        validateStatus: (status) => true,
      ),
    );

    return retryDio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        headers: requestOptions.headers
          ..['Authorization'] = 'Bearer $newAccessToken',
      ),
    );
  }
}

/// Retry interceptor for handling connection errors
class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int retries;
  final List<Duration> retryDelays;
  final void Function(String message)? logPrint;

  RetryInterceptor({
    required this.dio,
    this.retries = 3,
    this.retryDelays = const [
      Duration(seconds: 1),
      Duration(seconds: 2),
      Duration(seconds: 3),
    ],
    this.logPrint,
  });

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Only retry on connection errors, not on other errors
    if (_shouldRetry(err)) {
      int attempt = 0;

      // Get the request options
      final options = err.requestOptions;

      // Try to retry the request
      for (int i = 0; i < retries; i++) {
        attempt++;

        // Wait before retrying
        final delay = i < retryDelays.length
            ? retryDelays[i]
            : retryDelays.last;

        logPrint?.call(
          '🔄 Retry attempt $attempt/$retries after ${delay.inSeconds}s for ${options.path}',
        );

        await Future.delayed(delay);

        try {
          // Create a new dio instance to avoid interceptor loops
          final retryDio = Dio(dio.options);

          final response = await retryDio.request(
            options.path,
            data: options.data,
            queryParameters: options.queryParameters,
            options: Options(
              method: options.method,
              headers: options.headers,
              contentType: options.contentType,
              responseType: options.responseType,
              validateStatus: (status) => true,
            ),
          );

          logPrint?.call('✅ Retry successful on attempt $attempt');
          return handler.resolve(response);
        } catch (e) {
          logPrint?.call('❌ Retry failed on attempt $attempt: $e');

          // If this was the last retry, pass the error
          if (i == retries - 1) {
            return handler.next(err);
          }
          // Otherwise continue to next retry
        }
      }
    }

    // If we shouldn't retry or all retries failed, pass the error
    return handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    // Retry on connection errors, timeouts, and connection reset
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError ||
        (err.error != null &&
            err.error.toString().toLowerCase().contains('connection reset'));
  }
}
