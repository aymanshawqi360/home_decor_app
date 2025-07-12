import 'package:home_decor_app/core/networks/api_error_hundler.dart';
import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/sign_up_screen/data/api/sign_up_api_service.dart';
import 'package:home_decor_app/features/sign_up_screen/data/model/sign_up_request_model.dart';
import 'package:home_decor_app/features/sign_up_screen/data/model/sign_up_response_model.dart';
import 'package:home_decor_app/features/sign_up_screen/domain/entitys/sign_up_entity.dart';
import 'package:home_decor_app/features/sign_up_screen/domain/entitys/sign_up_request_entity.dart';
import 'package:home_decor_app/features/sign_up_screen/domain/repo/sign_up_repo.dart';

class RepoImplementation extends SignUpRepo {
  final SignUpApiService _signUpApiService;
  RepoImplementation(this._signUpApiService);

  @override
  Future<ApiResulte<SignUpEntity>> signUpRep(
    SignUpRequestEntity signUpRequestEntity,
  ) async {
    try {
      SignUpResponseModel signUpResponseModel = await _signUpApiService
          .getSignUp(
            SignUpRequestModel(
              confirmPassword: signUpRequestEntity.confirmPassword,
              dateOfBirth: signUpRequestEntity.dateOfBirth,
              email: signUpRequestEntity.email,
              fullName: signUpRequestEntity.fullName,
              mobileNumber: signUpRequestEntity.mobileNumber,
              password: signUpRequestEntity.password,
              userName: signUpRequestEntity.userName,
            ),
          );
      SignUpEntity signUpResponseEntity = SignUpEntity(
        accessToken: signUpResponseModel.accessToken,
        email: signUpResponseModel.user?.email,
        refreshToken: signUpResponseModel.refreshToken,
        userName: signUpResponseModel.user?.userName,
      );

      return ApiResulte.success(signUpResponseEntity);
    } catch (failure) {
      return ApiResulte.failure(ApiErrorHandler.apiHundle(failure));
    }
  }
}
