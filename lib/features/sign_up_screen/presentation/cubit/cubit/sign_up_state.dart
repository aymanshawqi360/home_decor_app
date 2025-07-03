// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:home_decor_app/core/networks/api_error_model.dart';

sealed class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpFailure extends SignUpState {
  final ApiErrorModel errormessage;

  SignUpFailure({required this.errormessage});
}

class SingUpisPasseord extends SignUpState {
  bool isPasseord;

  SingUpisPasseord(this.isPasseord);
}

class SignUpisConfirmPasseord extends SignUpState {
  bool isConfirmPasseord;
  SignUpisConfirmPasseord({required this.isConfirmPasseord});
}
