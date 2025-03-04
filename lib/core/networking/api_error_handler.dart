import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: 'Connection timeout with API server');
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: 'Send timeout with API server');
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: 'Receive timeout with API server');
        case DioExceptionType.badResponse:
        return _handleError(error.response?.data);
        case DioExceptionType.unknown:
          return ApiErrorModel(message: 'Unexpected error occurred');
        case DioExceptionType.cancel:
          return ApiErrorModel(message: 'Request to API server was cancelled');
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: 'No internet connection');
        default:
          return ApiErrorModel(message: 'Unexpected error occurred');
      }
    } else {
      return ApiErrorModel(message: 'Unexpected error occurred');
    }
  }
}

ApiErrorModel _handleError(dynamic error) {
  return ApiErrorModel(errors: error);
}
