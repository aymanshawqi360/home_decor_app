import 'package:dio/dio.dart';
import 'package:home_decor_app/core/newtorks/api_constants.dart';
import 'package:home_decor_app/features/login/data/api/login_api_constants.dart';
import 'package:home_decor_app/features/login/data/model/login_request_model.dart';
import 'package:home_decor_app/features/login/data/model/login_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class LoginApiService {
  factory LoginApiService(Dio dio, {String? baseUrl}) = _LoginApiService;

  @POST(LoginApiConstants.login)
  Future<LoginResponseModel> getLogin(
    @Body() LoginRequestModel loginRequestModel,
  );
}
