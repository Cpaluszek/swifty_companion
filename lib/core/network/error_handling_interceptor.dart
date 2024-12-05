import 'dart:io';

import 'package:dio/dio.dart';

class TimeoutException extends DioException {
  TimeoutException({required super.requestOptions});
  @override
  String toString() {
    return 'Connection timeout. Please try again later.';
  }
}

class UnknownErrorException extends DioException {
  UnknownErrorException({required super.requestOptions});
  @override
  String toString() {
    return 'An unknown error occurred. Please try again later.';
  }
}

class NoInternetException extends DioException {
  NoInternetException({required super.requestOptions});
  @override
  String toString() {
    return 'No internet connection detected. Please check your network and try again.';
  }
}

class BadRequestException extends DioException {
  BadRequestException({required super.requestOptions});
  @override
  String toString() {
    return 'Bad request. Please check your input and try again.';
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException({required super.requestOptions});
  @override
  String toString() {
    return 'Unauthorized access. Please verify your credentials.';
  }
}

class ForbiddenException extends DioException {
  ForbiddenException({required super.requestOptions});
  @override
  String toString() {
    return 'Access forbidden. You do not have permission to perform this action.';
  }
}

class NotFoundException extends DioException {
  NotFoundException({required super.requestOptions});
  @override
  String toString() {
    return 'Resource not found.';
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException({required super.requestOptions});
  @override
  String toString() {
    return 'Internal server error. Please try again later.';
  }
}

class ErrorHandlingInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw TimeoutException(requestOptions: err.requestOptions);
      case DioExceptionType.connectionError:
        throw NoInternetException(requestOptions: err.requestOptions);
      case DioExceptionType.badResponse:
        // Handle specific HTTP status codes
        final statusCode = err.response?.statusCode;
        if (statusCode != null) {
          if (statusCode >= 400 && statusCode < 500) {
            switch (statusCode) {
              case 400:
                throw BadRequestException(requestOptions: err.requestOptions);
              case 401:
                throw UnauthorizedException(requestOptions: err.requestOptions);
              case 403:
                throw ForbiddenException(requestOptions: err.requestOptions);
              case 404:
                throw NotFoundException(requestOptions: err.requestOptions);
              default:
                throw UnknownErrorException(requestOptions: err.requestOptions);
            }
          } else if (statusCode >= 500) {
            throw InternalServerErrorException(requestOptions: err.requestOptions);
          }
        }
        throw UnknownErrorException(requestOptions: err.requestOptions);
      case DioExceptionType.badCertificate:
        throw UnknownErrorException(requestOptions: err.requestOptions);
      case DioExceptionType.cancel:
        throw DioException(
          requestOptions: err.requestOptions,
          message: 'Request was cancelled.',
        );
      case DioExceptionType.unknown:
        if (err.error is SocketException) {
          throw NoInternetException(requestOptions: err.requestOptions);
        }
        throw UnknownErrorException(requestOptions: err.requestOptions);
    }
  }
}
