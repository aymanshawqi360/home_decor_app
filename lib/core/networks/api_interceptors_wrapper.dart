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
    // final excludedEndpoints = ['/login', '/signup', '/token/refresh/'];

    // if (!excludedEndpoints.any((test) => options.path.contains(test))) {
    String accessToken =
        await SaveTheToken.getData(Token.accesToken.name) ?? "";

    if (!accessToken.isNullOrEmp()) {
      options.headers['Authorization'] = 'Bearer $accessToken';
      debugPrint("accessToken");
    } else {
      debugPrint("Error in [ONREQUEST]");
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
      "ERORR[${err.response?.statusCode}] => PATH : ${err.requestOptions.path}",
    );

    // err.requestOptions.path.contains(Routes.login) &&
    // err.requestOptions.path.contains(Routes.signUp)
    if (err.response?.statusCode == 401) {
      final refreshResult = await refreshToken(dio: dio);

      if (refreshResult is Success<String>) {
        RequestOptions requestOptions = err.requestOptions;
        await SaveTheToken.setData(
          key: Token.accesToken.name,
          value: refreshResult.data ?? "",
        );
        requestOptions.headers['Authorization'] =
            "Bearer ${refreshResult.data}";

        return handler.resolve(await dio.fetch(requestOptions));
      } else if (refreshResult is Failure<String>) {
        //   //! Delete [Access_token] Or [Refresh_token]

        await SaveTheToken.deleteItem(key: Token.accesToken.name);
        await SaveTheToken.deleteItem(key: Token.refreshToken.name);
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
    // required String refreshToken,
    required Dio dio,
  }) async {
    final responseRefreshToken = await SaveTheToken.getData(
      Token.refreshToken.name,
    );
    try {
      final response = await dio.post(
        '${ApiConstants.baseUrl}token/refresh/',
        data: {'refresh': responseRefreshToken},
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
    