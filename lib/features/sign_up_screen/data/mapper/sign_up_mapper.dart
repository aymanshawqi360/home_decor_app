import 'package:home_decor_app/features/sign_up_screen/data/model/sign_up_response_model.dart';
import 'package:home_decor_app/features/sign_up_screen/domain/entitys/sign_up_entity.dart';

class SignUpMapper {
  static SignUpEntity getSignUp(SignUpResponseModel signUpResponseModel) {
    return SignUpEntity(
      accessToken: signUpResponseModel.accessToken,
      email: signUpResponseModel.user?.email ?? "defaultName",
      refreshToken: signUpResponseModel.refreshToken ?? "defaultRefreshToken",
      userName: signUpResponseModel.user?.userName ?? "defaultUserName",
    );
  }
}
