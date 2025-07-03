import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/sign_up_screen/domain/entitys/sign_up_entity.dart';
import 'package:home_decor_app/features/sign_up_screen/domain/entitys/sign_up_request_entity.dart';

abstract class SignUpRepo {
  Future<ApiResulte<SignUpEntity>> signUpRep(
    SignUpRequestEntity signUpRequestEntity,
  );
}
