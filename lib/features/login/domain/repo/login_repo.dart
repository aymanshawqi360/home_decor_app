import 'package:home_decor_app/core/networks/api_result.dart';
import 'package:home_decor_app/features/login/domain/entity/login_request_entity.dart';
import 'package:home_decor_app/features/login/domain/entity/login_response.entity.dart';

abstract class LoginRepo {
  Future<ApiResulte<LoginResponseEntity>> gotLogin(
    LoginRequestEntity loginRequestEntity,
  );
}
