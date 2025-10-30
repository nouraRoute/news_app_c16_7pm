import 'package:news_app_c16_7pm/common/error/failure_model.dart';

sealed class Response<T> {}

class Success<T> extends Response<T> {
  final T data;

  Success({required this.data});
}

class Failure<T> extends Response<T> {
  final FailureModel failure;

  Failure({required this.failure});
}
