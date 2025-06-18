import 'package:dio/dio.dart';
import 'package:home_decor_app/core/networks/api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel apiHundle(dynamic e) {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.cancel:
          return ApiErrorModel(
            message: "The request was cancelled before being sent.",
          );

        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
            message:
                "Connection to the server timed out. Please try again later.",
          );

        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            message: "Sending data took too long. Please try again.",
          );

        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            message: "The app couldn't receive data in time.",
          );

        case DioExceptionType.badCertificate:
          return ApiErrorModel(
            message:
                "There is a problem with the server's security certificate.",
          );

        case DioExceptionType.badResponse:
          return errorHundle(e.response?.data);

        case DioExceptionType.connectionError:
          return ApiErrorModel(
            message: "Please check your internet connection and try again.",
          );

        case DioExceptionType.unknown:
          return ApiErrorModel(
            message: "An unexpected error occurred. Please try again.",
          );
      }
    } else {
      return ApiErrorModel(message: "Unknown error occurred");
    }
  }

  static ApiErrorModel errorHundle(dynamic data) {
    return ApiErrorModel(message: data.toString());
  }
}
