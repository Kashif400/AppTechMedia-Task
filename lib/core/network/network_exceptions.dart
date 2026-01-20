import 'dart:io';
import 'package:dio/dio.dart';

class NetworkExceptions {
  static NetworkExceptions getDioException(dynamic error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions = RequestCancelled();
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions = RequestTimeout();
              break;
            case DioExceptionType.unknown:
              networkExceptions = NoInternetConnection();
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions = SendTimeout();
              break;
            case DioExceptionType.badResponse:
              switch (error.response?.statusCode) {
                case 400:
                  networkExceptions = BadRequest();
                  break;
                case 401:
                  networkExceptions = UnauthorisedRequest();
                  break;
                case 403:
                  networkExceptions = UnauthorisedRequest();
                  break;
                case 404:
                  networkExceptions = NotFound('Not found');
                  break;
                case 409:
                  networkExceptions = Conflict();
                  break;
                case 408:
                  networkExceptions = RequestTimeout();
                  break;
                case 500:
                  networkExceptions = InternalServerError();
                  break;
                case 503:
                  networkExceptions = ServiceUnavailable();
                  break;
                default:
                  var responseCode = error.response?.statusCode;
                  networkExceptions = DefaultError(
                    'Received invalid status code: $responseCode',
                  );
              }
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions = SendTimeout();
              break;
            case DioExceptionType.badCertificate:
              networkExceptions = BadRequest();
              break;
            case DioExceptionType.connectionError:
              networkExceptions = NoInternetConnection();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = NoInternetConnection();
        } else {
          networkExceptions = UnexpectedError();
        }
        return networkExceptions;
      } on FormatException {
        return FormatError();
      } catch (_) {
        return UnexpectedError();
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        return UnableToProcess();
      } else {
        return UnexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = '';
    if (networkExceptions is NotImplemented) {
      errorMessage = 'Not Implemented';
    } else if (networkExceptions is RequestCancelled) {
      errorMessage = 'Request Cancelled';
    } else if (networkExceptions is InternalServerError) {
      errorMessage = 'Internal Server Error';
    } else if (networkExceptions is NotFound) {
      errorMessage = networkExceptions.reason;
    } else if (networkExceptions is ServiceUnavailable) {
      errorMessage = 'Service unavailable';
    } else if (networkExceptions is MethodNotAllowed) {
      errorMessage = 'Method Not Allowed';
    } else if (networkExceptions is BadRequest) {
      errorMessage = 'Bad request';
    } else if (networkExceptions is UnauthorisedRequest) {
      errorMessage = 'Unauthorised request';
    } else if (networkExceptions is UnexpectedError) {
      errorMessage = 'Unexpected error occurred';
    } else if (networkExceptions is RequestTimeout) {
      errorMessage = 'Connection request timeout';
    } else if (networkExceptions is NoInternetConnection) {
      errorMessage = 'No internet connection';
    } else if (networkExceptions is Conflict) {
      errorMessage = 'Error due to a conflict';
    } else if (networkExceptions is SendTimeout) {
      errorMessage = 'Send timeout in connection with API server';
    } else if (networkExceptions is UnableToProcess) {
      errorMessage = 'Unable to process the data';
    } else if (networkExceptions is DefaultError) {
      errorMessage = networkExceptions.error;
    } else if (networkExceptions is FormatError) {
      errorMessage = 'Unexpected error occurred';
    } else {
      errorMessage = 'Unexpected error occurred';
    }
    return errorMessage;
  }
}

class NotImplemented extends NetworkExceptions {}

class RequestCancelled extends NetworkExceptions {}

class InternalServerError extends NetworkExceptions {}

class NotFound extends NetworkExceptions {
  final String reason;
  NotFound(this.reason);
}

class ServiceUnavailable extends NetworkExceptions {}

class MethodNotAllowed extends NetworkExceptions {}

class BadRequest extends NetworkExceptions {}

class UnauthorisedRequest extends NetworkExceptions {}

class UnexpectedError extends NetworkExceptions {}

class RequestTimeout extends NetworkExceptions {}

class NoInternetConnection extends NetworkExceptions {}

class Conflict extends NetworkExceptions {}

class SendTimeout extends NetworkExceptions {}

class UnableToProcess extends NetworkExceptions {}

class DefaultError extends NetworkExceptions {
  final String error;
  DefaultError(this.error);
}

class FormatError extends NetworkExceptions {}
