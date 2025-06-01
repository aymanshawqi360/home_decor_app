import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_decor_app/core/helper/app_assets.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/routes/routes.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/core/widgets/app_text_button.dart';
import 'package:home_decor_app/core/widgets/app_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _loginAppBar(context),

      body: Padding(
        padding: EdgeInsets.only(
          // left: MediaQuery.sizeOf(context).width / 13,
          left: 31.w,
          // top: MediaQuery.sizeOf(context).height / 50,
          top: 37.h,
          // right: MediaQuery.sizeOf(context).width / 13,
          right: 31.w,
          // bottom: MediaQuery.sizeOf(context).height / 20,
          bottom: 32.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Full name",
                style: TextStyles.font13LigthBrownMedium(context),
              ),
              verticalSpace(3),
              AppTextFormField(hintText: "Full name", validator: (vlaue) {}),
              verticalSpace(16),
              Text("Email", style: TextStyles.font13LigthBrownMedium(context)),
              AppTextFormField(validator: (vlaue) {}),
              verticalSpace(16),
              Text(
                "Mobile Number",
                style: TextStyles.font13LigthBrownMedium(context),
              ),
              verticalSpace(3),
              AppTextFormField(
                hintText: "+ 123 456 789",
                validator: (vlaue) {},
              ),
              verticalSpace(16),

              Text(
                "Date of birth",
                style: TextStyles.font13LigthBrownMedium(context),
              ),
              verticalSpace(3),
              AppTextFormField(hintText: "DD / MM /YYY", validator: (vlaue) {}),
              verticalSpace(16),
              Text(
                "Password",
                style: TextStyles.font13LigthBrownMedium(context),
              ),
              verticalSpace(3),
              AppTextFormField(
                suffixIcon: Icon(Icons.visibility, size: 22.r),
                hintText: "● ● ● ● ● ● ● ● ● ",
                validator: (vlaue) {},
              ),
              verticalSpace(16),
              Text(
                "Confirm Password",
                style: TextStyles.font13LigthBrownMedium(context),
              ),
              verticalSpace(3),
              AppTextFormField(
                suffixIcon: Icon(Icons.visibility, size: 22.r),
                hintText: "● ● ● ● ● ● ● ● ● ",
                validator: (vlaue) {},
              ),

              verticalSpace(26.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  // verticalSpace(24),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "    By continuing, you agree to \n",
                          style: TextStyles.font14DarkTaupeRegularLeagueSpartan,
                        ),

                        TextSpan(
                          text: "Terms of Use",
                          style:
                              TextStyles.font14DarkTaupeSemiBoldLeagueSpartan,
                        ),
                        TextSpan(
                          text: " and ",
                          style: TextStyles.font14DarkTaupeRegularLeagueSpartan,
                        ),
                        TextSpan(
                          text: "Privacy Policy.\n",
                          style:
                              TextStyles.font14DarkTaupeSemiBoldLeagueSpartan,
                        ),
                      ],
                    ),
                  ),

                  AppTextButton(text: "Sign Up"),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.sizeOf(context).height / 80,
                      right: MediaQuery.sizeOf(context).width / 70,
                    ),
                    child: Text(
                      textScaler: TextScaler.linear(1.0),
                      "or sign up with",
                      style: TextStyles.font13DarkGrayishBrownLight(context),
                    ),
                  ),
                  verticalSpace(13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      SvgPicture.asset(
                        AppAssets.imageAndSvg.facebookIcon,
                        width: 33.w,
                        height: 33.h,
                        // width: MediaQuery.sizeOf(context).width / 33,
                        // height: MediaQuery.sizeOf(context).width / 33,
                      ),
                      horizontalSpace(19.81),
                      SvgPicture.asset(
                        AppAssets.imageAndSvg.googleIcon,
                        width: 33.w,
                        height: 33.h,
                        // width: MediaQuery.sizeOf(context).width / 9,
                        // height: MediaQuery.sizeOf(context).width / 9,
                      ),
                    ],
                  ),

                  verticalSpace(9.12),
                  GestureDetector(
                    onTap: () {
                      context.pushNamedAndRemoveUntil(
                        Routes.login,
                        predicate: (_) => false,
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextStyles.font13DarkGrayishBrownLight(
                              context,
                            ),
                          ),
                          TextSpan(
                            text: "Log in",
                            style: TextStyles.font13LigthBrownLight(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _loginAppBar(BuildContext context) => AppBar(
    title: Text(
      textScaler: TextScaler.linear(1.0),
      "Create Account",
      style: TextStyles.font20LigthPinkSemiBold(context),
    ),
    centerTitle: true,
  );
}
