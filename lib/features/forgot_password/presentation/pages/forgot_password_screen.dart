import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/routes/routes.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/core/widgets/app_text_button.dart';
import 'package:home_decor_app/core/widgets/app_text_form_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _loginAppBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 35.w, right: 28.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  textScaler: TextScaler.linear(1.0),
                  "Reset password?",
                  style: TextStyles.font20darkGrayishBrownSemiBold,
                ),
                verticalSpace(13.88),
                Text(
                  textScaler: TextScaler.linear(1.0),
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                  style: TextStyles.font14DarkBrownRegular,
                ),
              ],
            ),
          ),
          verticalSpace(37.0),
          Container(
            height: MediaQuery.sizeOf(context).height / 1.4,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: ColorsManager.linen,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(31.r),
                topRight: Radius.circular(31.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height / 15,
                left: 32.w,
                right: 32.w,
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Text(
                          textScaler: TextScaler.linear(1.0),
                          "Enter your email address",
                          style: TextStyles.font15DarkBrownMedium,
                        ),
                      ),
                      verticalSpace(3),
                      AppTextFormField(
                        fillColor: ColorsManager.white,

                        validator: (value) {},
                      ),
                    ],
                  ),
                  verticalSpace(47.66),
                  AppTextButton(
                    text: "Next",
                    onTap: () {
                      context.pushNamed(Routes.setPassword);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _loginAppBar(BuildContext context) => AppBar(
    title: Text(
      textScaler: TextScaler.linear(1.0),
      "Forgot Password",
      style: TextStyles.font20LigthPinkSemiBold(context),
    ),
    centerTitle: true,
  );
}
