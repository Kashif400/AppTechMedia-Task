import 'package:dio/dio.dart';
import 'package:get/get.dart' as get_x;
import 'package:get_it/get_it.dart';
import '../models/login_response.dart';
import '../datasources/authentication_service.dart';
import '../../core/utils/local_storage_service.dart';
import '../../core/utils/talker_service.dart';

class TokenInterceptor extends Interceptor {
  final _localStorageService = GetIt.instance<LocalStorageService>();
  final _authService = GetIt.instance<AuthenticationService>();
  final _talker = GetIt.instance<TalkerService>();

  TokenInterceptor();

  late final RequestOptions? requestOptions;

  @override
  Future onRequest(RequestOptions? options, handler) async {
    _talker.debug(
      '🌐 Interceptor.onRequest',
      data: {'url': options?.uri.toString(), 'method': options?.method},
    );

    // Add appropriate token to headers (user token or guest token)
    final token = _authService.currentToken;
    if (token != null) {
      options?.headers['Authorization'] = 'Bearer $token';
      _talker.debug(
        '🔑 Using ${_authService.tokenType}: ${token.substring(0, 20)}...',
      );
    } else {
      _talker.warning('⚠️ No token available for request');
    }

    requestOptions = options;
    return handler.next(options!);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    _talker.debug(
      '🌐 Interceptor.onResponse',
      data: {
        'statusCode': response.statusCode,
        'url': response.requestOptions.uri.toString(),
      },
    );

    try {
      if (response.statusCode == 401) {
        _talker.warning(
          '🔒 Received 401 Unauthorized - attempting token refresh',
        );

        // Don't immediately clear the access token - keep it until we know refresh fails
        final refreshToken = _localStorageService.refreshToken;
        final refreshTokenExpiry = _localStorageService.refreshTokenExpiry;

        if (refreshToken == null || refreshToken.isEmpty) {
          _talker.error('❌ No refresh token available');
          GetIt.instance<AuthenticationService>().localSignOut();
          return handler.next(response);
        }

        if (refreshTokenExpiry == null || refreshTokenExpiry.isEmpty) {
          _talker.error('❌ Refresh token expiry is null or empty');
          GetIt.instance<AuthenticationService>().localSignOut();
          return handler.next(response);
        }

        try {
          final expiry = DateTime.parse(refreshTokenExpiry);
          if (expiry.isBefore(DateTime.now())) {
            _talker.error('❌ Refresh token has expired');
            GetIt.instance<AuthenticationService>().localSignOut();
            return handler.next(response);
          }
        } catch (e, stackTrace) {
          _talker.error(
            '❌ Error parsing refresh token expiry',
            stackTrace: stackTrace,
            message: e.toString(),
          );
          GetIt.instance<AuthenticationService>().localSignOut();
          return handler.next(response);
        }

        // Try refreshing the token
        _talker.info('🔄 Attempting to refresh access token');
        LoginResponse refreshResponse =
            await GetIt.instance<AuthenticationService>().refreshAccessToken();

        if (refreshResponse.success &&
            refreshResponse.data?.accessToken != null) {
          _talker.info('✅ Token refreshed successfully');

          // Update the original request with the new token and retry
          final newToken = refreshResponse.data!.accessToken;

          if (requestOptions != null) {
            final newOptions = requestOptions!.copyWith(
              headers: {
                ...requestOptions!.headers,
                'Authorization': 'Bearer $newToken',
              },
            );

            // Create a new dio instance to avoid infinite recursion
            final dio = Dio();
            dio.options.baseUrl = newOptions.baseUrl;
            dio.options.headers = newOptions.headers;

            try {
              final retriedResponse = await dio.request(
                newOptions.path,
                options: Options(
                  method: newOptions.method,
                  headers: newOptions.headers,
                  validateStatus: (status) => true, // Accept all status codes
                ),
                data: newOptions.data,
                queryParameters: newOptions.queryParameters,
              );

              _talker.info('✅ Retried request successful');
              return handler.resolve(retriedResponse);
            } catch (retryError, stackTrace) {
              _talker.error(
                '❌ Failed to retry request after token refresh',
                stackTrace: stackTrace,
                message: retryError.toString(),
              );
              return handler.next(response);
            }
          }
        } else {
          _talker.error('❌ Token refresh failed');
          GetIt.instance<AuthenticationService>().localSignOut();
          return handler.next(response);
        }
      }

      // If no 401, just forward the response
      _talker.debug('✅ Request successful, proceeding with response');
      return handler.next(response);
    } catch (e, stacktrace) {
      _talker.error(
        '❌ Error in onResponse',
        stackTrace: stacktrace,
        message: e.toString(),
      );
      return handler.next(response);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _talker.error(
      err,
      stackTrace: err.stackTrace,
      message:
          '🌐 Interceptor.onError: ${err.type} - ${err.message ?? "Unknown error"}\nURL: ${err.requestOptions.uri}',
    );

    // Don't show snackbar for timeout or connection errors as they're too common
    // and will be handled by the UI layer
    final shouldShowSnackbar =
        err.type != DioExceptionType.connectionTimeout &&
        err.type != DioExceptionType.sendTimeout &&
        err.type != DioExceptionType.receiveTimeout &&
        err.type != DioExceptionType.connectionError;

    try {
      // Only show snackbar if context is available, application is in foreground,
      // and it's not a timeout/connection error
      if (shouldShowSnackbar &&
          get_x.Get.context != null &&
          get_x.Get.isOverlaysOpen) {
        get_x.Get.snackbar(
          'Request Failed',
          err.message ?? "Unknown error",
          snackPosition: get_x.SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
      } else {
        _talker.debug("Cannot show error snackbar: ${err.message}");
      }
    } catch (e, stackTrace) {
      _talker.error(
        e,
        stackTrace: stackTrace,
        message: "Error showing snackbar",
      );
    }

    // Always resolve with a proper response to prevent further crashes
    // Don't call super.onError after handler.resolve to avoid "handler already called" error
    handler.resolve(
      Response(
        requestOptions: err.requestOptions,
        data: {'error': err.message, 'success': false},
        statusCode: err.response?.statusCode ?? 410,
      ),
    );
  }
}
