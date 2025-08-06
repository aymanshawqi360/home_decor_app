import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/networks/api_constants.dart';
import 'package:home_decor_app/core/networks/api_error_hundler.dart';
import 'package:home_decor_app/core/networks/api_result.dart';
import 'package:home_decor_app/core/networks/save_the_token.dart';

class ApiInterceptorsWrapper extends Interceptor {
  final Dio dio;

  ApiInterceptorsWrapper({required this.dio});
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await SaveTheToken.getData(Token.accesToken.toString());
    if (accessToken.isNotNullOrEmp()) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
      "ERORR[${err.response?.statusCode}] => PATH : ${err.requestOptions.path}",
    );

    if (err.response?.statusCode == 401) {
      final responseRefreshToken = await SaveTheToken.getData(
        Token.refreshToken.toString(),
      );
      // if (responseRefreshToken.isNotNullOrEmp()) {
      // handler.reject(err);

      final response = await refreshToken(refreshToken: responseRefreshToken);
      if (response is Success<String>) {
        await SaveTheToken.deleteItem(token: Token.accesToken.toString());
        RequestOptions requestOptions = err.requestOptions;
        await SaveTheToken.updateAccessToken(response.data.toString());
        String saveAccessToken = await SaveTheToken.getData(
          Token.accesToken.toString(),
        );
        requestOptions.headers['Authorization'] = "Bearer $saveAccessToken";

        Response resposn = await dio.fetch(requestOptions);
        return handler.resolve(resposn);
      } else if (response is Failure<String>) {
        //   //! Delete [Access_token] Or [Refresh_token]
        await SaveTheToken.deleteAllData();
        return handler.reject(err);
      }
    }

    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("[RESPONSE] : ${response.statusCode}");
    return handler.next(response);
  }

  Future<ApiResulte<String>> refreshToken({
    required String refreshToken,
  }) async {
    try {
      final response = await dio.post(
        "${ApiConstants.baseUrl}/token/refresh/",
        data: {"refresh": refreshToken},
      );
      return ApiResulte.success(response.data["access"]);
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHundle(e));
    }
  }
}

// if (!err.requestOptions.path.contains("/token/refresh/")) {

    // } else {

    // }
    