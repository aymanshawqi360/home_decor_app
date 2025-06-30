import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/sign_up_screen/domain/entitys/sign_up_entity.dart';
import 'package:home_decor_app/features/sign_up_screen/domain/entitys/sign_up_request_entity.dart';
import 'package:home_decor_app/features/sign_up_screen/domain/repo/sign_up_repo.dart';

class SignUpUseCases {
  final SignUpRepo _signUpRepo;
  SignUpUseCases(this._signUpRepo);

  Future<ApiResulte<SignUpEntity>> getSignUp(
    SignUpRequestEntity signUpRequestEntity,
  ) async {
    return await _signUpRepo.signUpRep(signUpRequestEntity);
  }
}
