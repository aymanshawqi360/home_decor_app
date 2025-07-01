import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/core/widgets/app_text_form_field.dart';
import 'package:home_decor_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:home_decor_app/features/login/presentation/cubit/login_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController controllerPasswrod;
  late TextEditingController controllerEmail;

  @override
  void initState() {
    controllerEmail = context.read<LoginCubit>().controllerEmail;
    controllerPasswrod = context.read<LoginCubit>().controllerPassword;
    super.initState();
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPasswrod.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final cubit = context.read<LoginCubit>();
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.sizeOf(context).height / 80,
            ),
            child: Text(
              textScaler: TextScaler.linear(1.0),
              "Email",
              style: TextStyles.font15DarkGrayishBrownMedium(context),
            ),
          ),

          AppTextFormField(
            //  obscureText: context.read<LoginCubit>().isPassword,
            controller: controllerEmail,
            validator: (value) {
              if (value?.isEmpty ?? value == null) {
                return "You are not enter email";
              }
            },
          ),
          verticalSpace(23),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.sizeOf(context).height / 80,
            ),
            child: Text(
              textScaler: TextScaler.linear(1.0),
              "Password",
              style: TextStyles.font15DarkGrayishBrownMedium(context),
            ),
          ),

          BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) => current is LoginHidePasswordWord,

            builder: (context, state) {
              bool isPasswrod = (state is LoginHidePasswordWord);
              return AppTextFormField(
                obscureText: isPasswrod ? state.isPasswrod : false,
                controller: controllerPasswrod,
                suffixIcon: GestureDetector(
                  onTap: () {
                    context.read<LoginCubit>().hidePasswordWord();
                  },
                  child: Icon(
                    isPasswrod ? Icons.visibility : Icons.visibility_off,
                    size: 22.r,
                  ),
                ),

                hintText: '●●●●●●●●',
                hintStyle: TextStyle(
                  letterSpacing: 5,
                  color: ColorsMananger.lightBeigepink,
                ),
                validator: (value) {
                  if (value?.isEmpty ?? value == null) {
                    return "You are not enter password";
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
