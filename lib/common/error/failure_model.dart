import 'package:dio/dio.dart';

abstract class FailureModel implements Exception {
  String errorMessage;
  int? errorCode;
  FailureModel({required this.errorMessage, this.errorCode});
  @override
  String toString() {
    return errorMessage;
  }

  static FailureModel getNetworkMessage(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return BaseError(
          errorMessage: 'Weak network connection!',
          errorCode: exception.response?.statusCode,
        );
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        return BaseError(
          errorMessage: 'Server Error',
          errorCode: exception.response?.statusCode,
        );
      case DioExceptionType.unknown:
        return BaseError(
          errorMessage: 'Something went wrong',
          errorCode: exception.response?.statusCode,
        );
    }
  }
}

class BaseError extends FailureModel {
  BaseError({required super.errorMessage, super.errorCode});
}
