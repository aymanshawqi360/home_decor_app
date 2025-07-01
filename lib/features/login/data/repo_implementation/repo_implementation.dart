import 'package:home_decor_app/core/newtorks/api_error_hundler.dart';
import 'package:home_decor_app/core/newtorks/api_reuselte.dart';
import 'package:home_decor_app/features/login/data/api/login_api_service.dart';
import 'package:home_decor_app/features/login/data/api/mapper/login_mapper.dart';
import 'package:home_decor_app/features/login/data/model/login_request_model.dart';
import 'package:home_decor_app/features/login/data/model/login_response_model.dart';
import 'package:home_decor_app/features/login/domain/entity/login_request_entity.dart';
import 'package:home_decor_app/features/login/domain/entity/login_response.entity.dart';
import 'package:home_decor_app/features/login/domain/repo/login_repo.dart';

class RepoImplementation extends LoginRepo {
  final LoginApiService _loginApiService;

  RepoImplementation(this._loginApiService);

  @override
  Future<ApiResulte<LoginResponseEntity>> gotLogin(
    LoginRequestEntity loginRequestEntity,
  ) async {
    try {
      LoginResponseModel loginResponseModel = await _loginApiService.getLogin(
        LoginRequestModel(
          passwrod: loginRequestEntity.passwrod,
          userName: loginRequestEntity.userName,
        ),
      );
      LoginResponseEntity loginResponseEntity = LoginMapper.gotLoginMapper(
        loginResponseModel,
      );
      return ApiResulte.success(loginResponseEntity);
    } catch (failure) {
      return ApiResulte.failure(ApiErrorHandler.apiHundle(failure));
    }
  }
}
