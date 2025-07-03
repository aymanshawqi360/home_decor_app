import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_decor_app/core/helper/app_assets.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/routes/routes.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/core/widgets/app_text_button.dart';
import 'package:home_decor_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:home_decor_app/features/login/presentation/widget/login_bloc_listener.dart';
import 'package:home_decor_app/features/login/presentation/widget/login_form.dart';
import 'package:home_decor_app/features/login/presentation/widget/welcome_please_enter_your_details_to_proceed.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _loginAppBar(context),
      body: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.sizeOf(context).width / 13,
          top: MediaQuery.sizeOf(context).height / 50,
          right: MediaQuery.sizeOf(context).width / 13,
          bottom: MediaQuery.sizeOf(context).height / 20,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomePleaseEnterYourDetailsToProceed(),
            verticalSpace(67),
            LoginForm(),
            verticalSpace(50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextButton(
                      onTap: () {
                        context.pushNamedAndRemoveUntil(
                          Routes.homeScreen,
                          predicate: (_) => false,
                        );
                      },
                    ),
                  ],
                ),
                verticalSpace(18.12),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.forgotPassword);
                  },
                  child: Text(
                    textScaler: TextScaler.linear(1.0),
                    "Forgot Password?",
                    style: TextStyles.font14DarkGrayishBrownSemiBold(context),
                  ),
                ),
              ],
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.sizeOf(context).width / 70,
                    ),
                    child: Text(
                      textScaler: TextScaler.linear(1.0),
                      "or sign up with",
                      style: TextStyles.font13DarkGrayishBrownLight(context),
                    ),
                  ),
                  verticalSpace(19),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      SvgPicture.asset(
                        AppAssets.imageAndSvg.facebookIcon,
                        width: MediaQuery.sizeOf(context).width / 9,
                        height: MediaQuery.sizeOf(context).width / 9,
                      ),
                      horizontalSpace(19.81),
                      SvgPicture.asset(
                        AppAssets.imageAndSvg.googleIcon,
                        width: MediaQuery.sizeOf(context).width / 9,
                        height: MediaQuery.sizeOf(context).width / 9,
                      ),
                    ],
                  ),
                  verticalSpace(19.12),

                  GestureDetector(
                    onTap: () {
                      // context.pushNamed(Routes.signUp);
                      context.pushNamedAndRemoveUntil(
                        Routes.signUp,
                        predicate: (_) => false,
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don’t have an account? ",
                            style: TextStyles.font13DarkGrayishBrownLight(
                              context,
                            ),
                          ),
                          TextSpan(
                            text: " Sign Up",
                            style: TextStyles.font13LigthBrownLight(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            LoginBlocListener(),
          ],
        ),
      ),
    );
  }

  _checkUserNameAndPasswrod(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().getLogin();
    }
  }

  AppBar _loginAppBar(BuildContext context) => AppBar(
    title: Text(
      textScaler: TextScaler.linear(1.0),
      "Login",
      style: TextStyles.font20LigthPinkSemiBold(context),
    ),
    centerTitle: true,
  );
}
