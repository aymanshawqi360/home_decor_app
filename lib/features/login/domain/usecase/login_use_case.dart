import 'package:home_decor_app/core/newtorks/api_reuselte.dart';
import 'package:home_decor_app/features/login/domain/entity/login_request_entity.dart';
import 'package:home_decor_app/features/login/domain/entity/login_response.entity.dart';
import 'package:home_decor_app/features/login/domain/repo/login_repo.dart';

class LoginUseCase {
  final LoginRepo _loginRepo;
  LoginUseCase(this._loginRepo);
  Future<ApiResulte<LoginResponseEntity>> getLogin(
    LoginRequestEntity loginRequestEntity,
  ) async {
    return await _loginRepo.gotLogin(loginRequestEntity);
  }
}
