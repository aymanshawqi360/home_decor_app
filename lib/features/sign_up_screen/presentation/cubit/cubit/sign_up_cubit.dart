import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:home_decor_app/core/networks/api_error_model.dart';
import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/sign_up_screen/domain/entitys/sign_up_entity.dart';
import 'package:home_decor_app/features/sign_up_screen/domain/entitys/sign_up_request_entity.dart';
import 'package:home_decor_app/features/sign_up_screen/domain/use_cases/sign_up_use_cases.dart';
import 'package:home_decor_app/features/sign_up_screen/presentation/cubit/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCases _signUpUseCases;

  SignUpCubit(this._signUpUseCases) : super(SignUpInitial());
  final formKey = GlobalKey<FormState>();
  final constantFullName = TextEditingController();
  final constantEmail = TextEditingController();
  final constantUserName = TextEditingController();
  final constantMobileNumber = TextEditingController();
  final constantDateOfBirth = TextEditingController();
  final constantPassword = TextEditingController();
  final constantConfirmPassword = TextEditingController();
  bool isPassword = true;
  bool isConfirmPassword = true;
  void getSignUp() async {
    emit(SignUpLoading());
    final response = await _signUpUseCases.getSignUp(
      SignUpRequestEntity(
        confirmPassword: constantConfirmPassword.text,
        dateOfBirth: constantDateOfBirth.text,
        // getDateOfBirth(constantDateOfBirth.text),
        email: constantEmail.text,
        fullName: constantFullName.text,
        mobileNumber: constantMobileNumber.text,
        password: constantPassword.text,
        userName: constantUserName.text,
      ),
    );

    if (response is Success<SignUpEntity>) {
      // await _getToken(
      //   accessToken: response.data!.accessToken.toString(),
      //   refreshToken: response.data!.refreshToken.toString(),
      // );
      // await _getToken(
      //   key: Token.accesToken.name,
      //   value: response.data?.accessToken ?? "",
      // );
      // await _getToken(
      //   key: Token.refreshToken.name,
      //   value: response.data?.refreshToken ?? "",
      // );
      emit(SignUpSuccess());
    } else if (response is Failure<SignUpEntity>) {
      emit(
        SignUpFailure(
          errormessage: ApiErrorModel(
            errorMessage: response.errorMessage!.errorMessage.toString(),
            errors: response.errorMessage!.errors,
          ),
        ),
      );
    }
  }

  void cheackIsPassword() {
    isPassword = !isPassword;

    emit(SingUpisPasseord(isPassword));
  }

  void cheackIsConfirmPassword() {
    isConfirmPassword = !isConfirmPassword;
    emit(SignUpisConfirmPasseord(isConfirmPasseord: isConfirmPassword));
  }

  // _getToken({required String key, required String value}) {
  //   SaveTheToken.setData(key: key, value: value);
  // }

  // String getDateOfBirth(String userDateOfBirth) {
  //   List<String> date = userDateOfBirth.split('/');
  //   print("date========================${date}");
  //   DateTime dateTime = DateTime(
  //     int.parse(date[0]),
  //     int.parse(date[1]),
  //     int.parse(date[2]),
  //   );

  //   DateTime dateTime = DateTime.parse("${userDateOfBirth}");
  //   String dateEdit =
  //       "${dateTime.year}-"
  //       "${dateTime.month.toString().padLeft(2, "0")}-"
  //       "${dateTime.day.toString().padLeft(2, '0')}";

  // print("date================================${dateEdit}");
  //   return (dateEdit);
  // }
}
