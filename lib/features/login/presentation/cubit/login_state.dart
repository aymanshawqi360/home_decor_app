import 'package:home_decor_app/core/newtorks/api_error_model.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFailure extends LoginState {
  final ApiErrorModel errorMessage;

  LoginFailure({required this.errorMessage});
}

class LoginHidePasswordWord extends LoginState {
  final bool isPasswrod;

  LoginHidePasswordWord({required this.isPasswrod});
}
