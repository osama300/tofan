import 'package:dio/dio.dart';

class ApiErrorHandler {
  static  handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          return 'Request canceled';
        case DioExceptionType.connectionTimeout:
          return 'Connection timeout';
        case DioExceptionType.sendTimeout:
          return 'Send timeout';
        case DioExceptionType.receiveTimeout:
          return 'Receive timeout';
        case DioExceptionType.badResponse:
        // Handle HTTP errors
          return _handleResponseError(error.response);
        case DioExceptionType.badCertificate:
          // TODO: Handle this case.
        case DioExceptionType.connectionError:

        case DioExceptionType.unknown:
          return DioExceptionType.unknown;
          // TODO: Handle this case.
      }
    } else {
      return 'Unexpected error';
    }
  }

  static String _handleResponseError(Response? response) {
    if (response != null) {
      switch (response.statusCode) {
        case 400:
          return 'Bad request';
        case 401:
          return 'Unauthorized';
        case 403:
          return 'Forbidden';
        case 404:
          return 'Not found';
        case 500:
          return 'Internal server error';
        default:
          return 'Error: ${response.statusCode}';
      }
    } else {
      return 'Unexpected error';
    }
  }
}
