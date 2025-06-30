import 'package:dio/dio.dart';
import 'package:home_decor_app/core/networks/api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel apiHundle(dynamic e) {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.cancel:
          return ApiErrorModel(
            errorMessage: "The request was cancelled before being sent.",
          );

        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
            errorMessage:
                "Connection to the server timed out. Please try again later.",
          );

        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            errorMessage: "Sending data took too long. Please try again.",
          );

        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            errorMessage: "The app couldn't receive data in time.",
          );

        case DioExceptionType.badCertificate:
          return ApiErrorModel(
            errorMessage:
                "There is a problem with the server's security certificate.",
          );

        case DioExceptionType.badResponse:
          return errorHundle(e.response?.data);

        case DioExceptionType.connectionError:
          return ApiErrorModel(
            errorMessage:
                "Please check your internet connection and try again.",
          );

        case DioExceptionType.unknown:
          return ApiErrorModel(
            errorMessage: "An unexpected error occurred. Please try again.",
          );
      }
    } else {
      return ApiErrorModel(errorMessage: "Unknown error occurred");
    }
  }

  static ApiErrorModel errorHundle(dynamic data) {
    return ApiErrorModel(errors: data["errors"]);
  }
}
