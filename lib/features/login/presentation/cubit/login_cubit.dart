import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home_decor_app/core/networks/api_constants.dart';
import 'package:home_decor_app/core/networks/api_error_model.dart';
import 'package:home_decor_app/core/networks/api_result.dart';
import 'package:home_decor_app/core/networks/save_the_token.dart';
import 'package:home_decor_app/features/login/domain/entity/login_request_entity.dart';
import 'package:home_decor_app/features/login/domain/entity/login_response.entity.dart';
import 'package:home_decor_app/features/login/domain/usecase/login_use_case.dart';
import 'package:home_decor_app/features/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  LoginCubit(this._loginUseCase) : super(LoginInitial());
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPassword = false;
  void getLogin() async {
    emit(LoginLoading());
    final response = await _loginUseCase.getLogin(
      LoginRequestEntity(
        passwrod: controllerPassword.text,
        userName: controllerEmail.text,
      ),
    );
    if (response is Success<LoginResponseEntity>) {
      //response.data.
      debugPrint(
        "accessToken-------------------------------${response.data!.accessToken}",
      );
      debugPrint(
        "refreshToken------------------------------${response.data!.refreshToken}",
      );
      // await _getToken(
      //   accessToken: response.data?.accessToken ?? "",
      //   refreshToken: response.data?.accessToken ?? "",
      // );
      await _getToken(
        key: Token.accesToken.name,
        value: response.data?.accessToken ?? "",
      );
      await _getToken(
        key: Token.refreshToken.name,
        value: response.data?.refreshToken ?? "",
      );
      emit(LoginSuccess());
    } else if (response is Failure<LoginResponseEntity>) {
      emit(
        LoginFailure(
          errorMessage: ApiErrorModel(
            errorMessage: response.errorMessage!.errorMessage,
            errors: response.errorMessage!.errors,
          ),
        ),
      );
    }
  }

  _getToken({required String key, required String value}) {
    SaveTheToken.setData(key: key, value: value);
  }

  void hidePasswordWord() {
    isPassword = !isPassword;
    emit(LoginHidePasswordWord(isPasswrod: isPassword));
  }
}
