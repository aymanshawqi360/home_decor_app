import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_decor_app/core/helper/app_assets.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/routes/routes.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/core/widgets/app_do_you_have_accound.dart';
import 'package:home_decor_app/core/widgets/app_or_sign_up_with.dart';
import 'package:home_decor_app/core/widgets/app_text_button.dart';
import 'package:home_decor_app/features/sign_up_screen/presentation/cubit/cubit/sign_up_cubit.dart';
import 'package:home_decor_app/features/sign_up_screen/presentation/cubit/cubit/sign_up_state.dart';
import 'package:home_decor_app/features/sign_up_screen/presentation/widget/sign_up_bloc_builder.dart';
import 'package:home_decor_app/features/sign_up_screen/presentation/widget/sign_up_form.dart';
import 'package:home_decor_app/features/sign_up_screen/presentation/widget/terms_of_use.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _loginAppBar(context),

      body: Padding(
        padding: EdgeInsets.only(
          left: context.screenWidth / 13,
          // right: 31.w,
          right: context.screenWidth / 13,
          bottom: context.screenHeight / 50,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SignUpForm(),
              verticalSpace(26.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  TermsOfUse(),
                  BlocBuilder<SignUpCubit, SignUpState>(
                    buildWhen:
                        (previous, current) =>
                            current is SignUpLoading ||
                            current is SignUpSuccess ||
                            current is SignUpFailure,
                    builder: (context, state) {
                      return AppTextButton(
                        onTap: () {
                          _checkToData(context: context);
                        },
                        width: context.screenHeight / 4.4,
                        text: "Sign Up",
                      );
                    },
                  ),
                  AppOrSignUpWith(),
                  verticalSpace(13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      SvgPicture.asset(
                        AppAssets.imageAndSvg.facebookIcon,
                        width: 33.w,
                        height: 33.h,
                      ),
                      horizontalSpace(19.81),
                      SvgPicture.asset(
                        AppAssets.imageAndSvg.googleIcon,
                        width: 33.w,
                        height: 33.h,
                      ),
                    ],
                  ),

                  verticalSpace(9.12),
                  AppDoYouHaveAccound(
                    accound: "Already have an account?",
                    loginOrSingUp: "Login",
                    onTap: () {
                      context.pushNamedAndRemoveUntil(
                        Routes.login,
                        predicate: (_) => false,
                      );
                    },
                  ),
                ],
              ),
              SignUpBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _loginAppBar(BuildContext context) => AppBar(
    surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
    title: Text(
      textScaler: TextScaler.linear(1.0),
      "Create Account",
      style: TextStyles.font20LigthPinkSemiBold(context),
    ),
    centerTitle: true,
  );

  void _checkToData({required BuildContext context}) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().getSignUp();
    }
  }
}
