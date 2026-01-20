import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../constants/app_config.dart';
import '../utils/local_storage_service.dart';
import 'network_exceptions.dart';
import 'request_response.dart';
import 'interceptors.dart';

class DioClient {
  final _config = GetIt.instance<AppConfig>();
  final _localStorage = GetIt.instance<LocalStorageService>();

  Future<Dio> launchDio({bool isMultipart = false}) async {
    String? accessToken = _localStorage.accessToken;

    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    dio.interceptors.add(TokenInterceptor());

    // Add retry interceptor for connection errors
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: (message) => print('🔄 $message'),
        retries: 3,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 3),
        ],
      ),
    );

    // Only set Content-Type for non-multipart requests
    if (!isMultipart) {
      dio.options.headers['Content-Type'] = 'application/json';
    }

    dio.options.headers['accept'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    dio.options.followRedirects = false;
    dio.options.baseUrl = _config.baseUrl;

    // Increased timeouts to handle slow connections better
    dio.options.connectTimeout = const Duration(minutes: 2);
    dio.options.receiveTimeout = const Duration(minutes: 2);
    dio.options.sendTimeout = const Duration(minutes: 2);

    // Accept all status codes so we can handle errors in the response, not as exceptions
    dio.options.validateStatus = (s) => true;
    return dio;
  }

  Future<RequestResponse> get({
    required String endPoint,
    Map<String, dynamic>? params,
    String? url,
  }) async {
    String? errorMessage;
    try {
      Dio dio = await launchDio();
      final response = await dio.get(
        url ?? '${_config.baseUrl}/$endPoint',
        queryParameters: params,
      );

      if (response.statusCode == 200) {
        return RequestResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        String? backendError;
        if (response.data is Map && response.data['error'] != null) {
          backendError = response.data['error'];
        }
        return RequestResponse(false, error: backendError ?? 'Server Error');
      } else {
        if (response.data is Map && response.data['success'] == false) {
          return RequestResponse.fromJson(response.data);
        }
        return RequestResponse(
          false,
          error: response.statusMessage,
          message: 'Server Request Failed',
        );
      }
    } catch (error) {
      print('❌ @get error: $error');
      final networkExceptions = NetworkExceptions.getDioException(error);
      errorMessage = NetworkExceptions.getErrorMessage(networkExceptions);
    }
    return RequestResponse.fromJson({'success': false, 'error': errorMessage});
  }

  Future<RequestResponse> post({required String endPoint, dynamic data}) async {
    String? errorMessage;
    try {
      print('📤 POST: ${_config.baseUrl}/$endPoint');
      bool isMultipart = data is FormData;
      Dio dio = await launchDio(isMultipart: isMultipart);
      final response = await dio.post(
        '${_config.baseUrl}/$endPoint',
        data: data,
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 401 ||
          response.statusCode == 400 ||
          response.statusCode == 403 ||
          response.statusCode == 404 ||
          response.statusCode == 409 ||
          response.statusCode == 422) {
        return RequestResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        String? backendError;
        if (response.data is Map && response.data['error'] != null) {
          backendError = response.data['error'];
        }
        return RequestResponse(false, error: backendError ?? 'Server Error');
      } else {
        if (response.data is Map && response.data['success'] == false) {
          return RequestResponse.fromJson(response.data);
        }
        return RequestResponse(
          false,
          error: response.statusMessage,
          message: 'Server Request Failed',
        );
      }
    } catch (error) {
      print('❌ @post error: $error');
      final networkExceptions = NetworkExceptions.getDioException(error);
      errorMessage = NetworkExceptions.getErrorMessage(networkExceptions);
    }
    return RequestResponse.fromJson({'success': false, 'error': errorMessage});
  }

  Future<RequestResponse> put({required String endPoint, dynamic data}) async {
    String? errorMessage;
    try {
      Dio dio = await launchDio();
      final response = await dio.put(
        '${_config.baseUrl}/$endPoint',
        data: data,
      );

      if (response.statusCode == 200 ||
          response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 403 ||
          response.statusCode == 404 ||
          response.statusCode == 409 ||
          response.statusCode == 422) {
        return RequestResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        String? backendError;
        if (response.data is Map && response.data['error'] != null) {
          backendError = response.data['error'];
        }
        return RequestResponse(false, error: backendError ?? 'Server Error');
      } else {
        if (response.data is Map && response.data['success'] == false) {
          return RequestResponse.fromJson(response.data);
        }
        return RequestResponse(
          false,
          error: response.statusMessage,
          message: 'Server Request Failed',
        );
      }
    } catch (error) {
      print('❌ @put error: $error');
      final networkExceptions = NetworkExceptions.getDioException(error);
      errorMessage = NetworkExceptions.getErrorMessage(networkExceptions);
    }
    return RequestResponse.fromJson({'success': false, 'error': errorMessage});
  }

  Future<RequestResponse> patch({
    required String endPoint,
    dynamic data,
  }) async {
    String? errorMessage;
    try {
      Dio dio = await launchDio();
      final response = await dio.patch(
        '${_config.baseUrl}/$endPoint',
        data: data,
      );

      if (response.statusCode == 200 ||
          response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 403 ||
          response.statusCode == 404 ||
          response.statusCode == 409 ||
          response.statusCode == 422) {
        return RequestResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        String? backendError;
        if (response.data is Map && response.data['error'] != null) {
          backendError = response.data['error'];
        }
        return RequestResponse(false, error: backendError ?? 'Server Error');
      } else {
        if (response.data is Map && response.data['success'] == false) {
          return RequestResponse.fromJson(response.data);
        }
        return RequestResponse(
          false,
          error: response.statusMessage,
          message: 'Server Request Failed',
        );
      }
    } catch (error) {
      print('❌ @patch error: $error');
      final networkExceptions = NetworkExceptions.getDioException(error);
      errorMessage = NetworkExceptions.getErrorMessage(networkExceptions);
    }
    return RequestResponse.fromJson({'success': false, 'error': errorMessage});
  }

  Future<RequestResponse> delete({
    required String endPoint,
    Map<String, dynamic>? params,
  }) async {
    String? errorMessage;
    try {
      Dio dio = await launchDio();
      final response = await dio.delete(
        '${_config.baseUrl}/$endPoint',
        queryParameters: params,
      );

      if (response.statusCode == 200 ||
          response.statusCode == 400 ||
          response.statusCode == 401 ||
          response.statusCode == 403 ||
          response.statusCode == 404 ||
          response.statusCode == 409 ||
          response.statusCode == 422) {
        return RequestResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        String? backendError;
        if (response.data is Map && response.data['error'] != null) {
          backendError = response.data['error'];
        }
        return RequestResponse(false, error: backendError ?? 'Server Error');
      } else {
        if (response.data is Map && response.data['success'] == false) {
          return RequestResponse.fromJson(response.data);
        }
        return RequestResponse(
          false,
          error: response.statusMessage,
          message: 'Server Request Failed',
        );
      }
    } catch (error) {
      print('❌ @delete error: $error');
      final networkExceptions = NetworkExceptions.getDioException(error);
      errorMessage = NetworkExceptions.getErrorMessage(networkExceptions);
    }
    return RequestResponse.fromJson({'success': false, 'error': errorMessage});
  }
}
