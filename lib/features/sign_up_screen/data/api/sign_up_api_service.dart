import 'package:dio/dio.dart';
import 'package:home_decor_app/core/networks/api_constants.dart';
import 'package:home_decor_app/features/sign_up_screen/data/api/sign_up_api_constants.dart';
import 'package:home_decor_app/features/sign_up_screen/data/model/sign_up_request_model.dart';
import 'package:home_decor_app/features/sign_up_screen/data/model/sign_up_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_up_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SignUpApiService {
  factory SignUpApiService(Dio dio, {String? baseUrl}) = _SignUpApiService;

  @POST(SignUpApiConstants.register)
  Future<SignUpResponseModel> getSignUp(
    @Body() SignUpRequestModel signUpRequestModel,
  );
}
