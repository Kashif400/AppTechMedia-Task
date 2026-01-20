import 'package:dio/dio.dart';
import 'package:get/get.dart' as getX;
import 'package:get_it/get_it.dart';
import '../models/login_response.dart';
import '../datasources/authentication_service.dart';
import '../../core/utils/local_storage_service.dart';

class TokenInterceptor extends Interceptor {
  final _localStorageService = GetIt.instance<LocalStorageService>();
  final _authService = GetIt.instance<AuthenticationService>();

  TokenInterceptor();
  // ignore: prefer_typing_uninitialized_variables
  late final requestOptions;

  @override
  Future onRequest(RequestOptions? options, handler) async {
    print('@Interceptor.onRequest: Dio Request $options');

    // Add appropriate token to headers (user token or guest token)
    final token = _authService.currentToken;
    if (token != null) {
      options?.headers['Authorization'] = 'Bearer $token';
      print('🔑 Using ${_authService.tokenType}: ${token.substring(0, 20)}...');
    } else {
      print('⚠️ No token available for request');
    }

    requestOptions = options;
    return handler.next(options!);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    print('@Interceptor.onResponse: Dio Response $response');

    try {
      if (response.statusCode == 401) {
        print('🔒 Received 401 Unauthorized - attempting token refresh');

        // Don't immediately clear the access token - keep it until we know refresh fails
        final refreshToken = _localStorageService.refreshToken;
        final refreshTokenExpiry = _localStorageService.refreshTokenExpiry;

        if (refreshToken == null || refreshToken.isEmpty) {
          print('❌ No refresh token available');
          GetIt.instance<AuthenticationService>().localSignOut();
          return handler.next(response);
        }

        if (refreshTokenExpiry == null || refreshTokenExpiry.isEmpty) {
          print('❌ Refresh token expiry is null or empty');
          GetIt.instance<AuthenticationService>().localSignOut();
          return handler.next(response);
        }

        try {
          final expiry = DateTime.parse(refreshTokenExpiry);
          if (expiry.isBefore(DateTime.now())) {
            print('❌ Refresh token has expired');
            GetIt.instance<AuthenticationService>().localSignOut();
            return handler.next(response);
          }
        } catch (e) {
          print('❌ Error parsing refresh token expiry: $e');
          GetIt.instance<AuthenticationService>().localSignOut();
          return handler.next(response);
        }

        // Try refreshing the token
        print('🔄 Attempting to refresh access token');
        LoginResponse refreshResponse =
            await GetIt.instance<AuthenticationService>().refreshAccessToken();

        if (refreshResponse.success &&
            refreshResponse.data?.accessToken != null) {
          print('✅ Token refreshed successfully');

          // Update the original request with the new token and retry
          final newToken = refreshResponse.data!.accessToken;
          final newOptions = requestOptions.copyWith(
            headers: {
              ...requestOptions.headers,
              'Authorization': 'Bearer $newToken',
            },
          );

          // Create a new dio instance to avoid infinite recursion
          final dio = Dio();
          dio.options = newOptions;

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

            print('✅ Retried request successful');
            return handler.resolve(retriedResponse);
          } catch (retryError) {
            print('❌ Failed to retry request after token refresh: $retryError');
            return handler.next(response);
          }
        } else {
          print('❌ Token refresh failed');
          GetIt.instance<AuthenticationService>().localSignOut();
          return handler.next(response);
        }
      }

      // If no 401, just forward the response
      print('✅ Request successful, proceeding with response');
      return handler.next(response);
    } catch (e, stacktrace) {
      print('❌ Error in onResponse: $e\n$stacktrace');
      return handler.next(response);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('@Interceptor.onError: Dio Error ${err.message}');

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
          getX.Get.context != null &&
          getX.Get.isOverlaysOpen) {
        getX.Get.snackbar(
          'Request Failed',
          err.message ?? "Unknown error",
          snackPosition: getX.SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
        );
      } else {
        print("Cannot show error snackbar: ${err.message}");
      }
    } catch (e) {
      print("Error showing snackbar: $e");
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
