import 'package:home_decor_app/core/newtorks/api_error_model.dart';

class ApiResulte<T> {
  ApiResulte();
  factory ApiResulte.success(T data) = Success<T>;
  factory ApiResulte.failure(ApiErrorModel apiErrorModel) = Failure<T>;
}

class Success<T> extends ApiResulte<T> {
  T? data;
  Success(this.data);
}

class Failure<T> extends ApiResulte<T> {
  ApiErrorModel? errorMessage;
  Failure(this.errorMessage);
}
