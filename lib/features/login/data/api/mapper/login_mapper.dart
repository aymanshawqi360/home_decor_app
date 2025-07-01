import 'package:home_decor_app/features/login/data/model/login_response_model.dart';
import 'package:home_decor_app/features/login/domain/entity/login_response.entity.dart';

class LoginMapper {
  static LoginResponseEntity gotLoginMapper(
    LoginResponseModel loginResponseModel,
  ) {
    return LoginResponseEntity(
      accessToken: loginResponseModel.accessToken ?? "defaultAccessToken",
      refreshToken: loginResponseModel.refreshToken ?? "defaultRefreshToken",
      email: loginResponseModel.user?.email ?? "defaultEmail",
      userName: loginResponseModel.user?.userName ?? "defaultUserName",
    );
  }
}
