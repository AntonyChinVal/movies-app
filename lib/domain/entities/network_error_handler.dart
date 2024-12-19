import 'dart:io';
import 'package:dio/dio.dart';

class NetworkError implements Exception {
  final String message;
  final int? statusCode;
  final String? errorCode;

  NetworkError({
    required this.message,
    this.statusCode,
    this.errorCode,
  });

  factory NetworkError.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkError(
          message:
              'Connection timed out. Please check your internet connection.',
          errorCode: 'TIMEOUT_ERROR',
        );

      case DioExceptionType.connectionError:
        return NetworkError(
          message: 'No internet connection.',
          errorCode: 'NO_CONNECTION',
        );

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        String message;

        switch (statusCode) {
          case 400:
            message = 'Invalid request';
            break;
          case 401:
            message = 'Unauthorized access';
            break;
          case 403:
            message = 'Access forbidden';
            break;
          case 404:
            message = 'Resource not found';
            break;
          case 429:
            message = 'Too many requests. Please try again later.';
            break;
          case 500:
            message = 'Internal server error';
            break;
          default:
            message = 'Something went wrong';
        }

        return NetworkError(
          message: message,
          statusCode: statusCode,
          errorCode: 'HTTP_ERROR',
        );

      default:
        if (error.error is SocketException) {
          return NetworkError(
            message: 'No internet connection.',
            errorCode: 'NO_CONNECTION',
          );
        }
        return NetworkError(
          message: 'An unexpected error occurred.',
          errorCode: 'UNKNOWN_ERROR',
        );
    }
  }
}
