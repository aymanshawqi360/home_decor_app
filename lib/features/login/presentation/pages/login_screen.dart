import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_decor_app/core/helper/app_assets.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/core/widgets/app_text_button.dart';
import 'package:home_decor_app/core/widgets/app_text_form_field.dart';

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textScaler: TextScaler.linear(1.0),
                  "Welcome",
                  style: TextStyles.font20DarkGrayishBrownSemiBold(context),
                ),
                verticalSpace(11),
                Text(
                  textScaler: TextScaler.linear(1.0),
                  "Please enter your details to proceed.",
                  style: TextStyles.font14DarkGrayishBrownRegular(context),
                ),
              ],
            ),
            verticalSpace(67),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.sizeOf(context).height / 80,
              ),
              child: Text(
                textScaler: TextScaler.linear(1.0),
                "Username Or Email",
                style: TextStyles.font15DarkGrayishBrownMedium(context),
              ),
            ),

            AppTextFormField(validator: (value) {}),
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

            AppTextFormField(
              suffixIcon: GestureDetector(
                onTap: () {},
                child: Icon(Icons.visibility, size: 22.r),
              ),

              hintText: '●●●●●●●●●●●●●●●●',
              validator: (value) {},
            ),
            verticalSpace(50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [AppTextButton()],
                ),
                verticalSpace(18.12),
                Text(
                  textScaler: TextScaler.linear(1.0),
                  "Forgot Password?",
                  style: TextStyles.font14DarkGrayishBrownSemiBold(context),
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

                  RichText(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
