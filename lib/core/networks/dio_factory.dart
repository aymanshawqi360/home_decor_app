import 'package:dio/dio.dart';
import 'package:home_decor_app/core/networks/api_interceptors_wrapper.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      addDioInterceptor();
      //  dio!.interceptors.add(ApiInterceptorsWrapper(dio: dio!));
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    // ApiInterceptorsWrapper(dio: dio!);
    dio?.interceptors.add(ApiInterceptorsWrapper(dio: dio!));

    // dio?.interceptors.add(ApiInterceptorsWrapper(dio: dio!));
  }
}
