import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/core/widgets/app_text_button.dart';
import 'package:home_decor_app/core/widgets/app_text_form_field.dart';

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _loginAppBar(context),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 35.w, right: 28.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    textScaler: TextScaler.linear(1.0),
                    "Change The Password",
                    style: TextStyles.font20darkGrayishBrownSemiBold,
                  ),
                  verticalSpace(13.88),
                  Text(
                    textScaler: TextScaler.linear(1.0),
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                    style: TextStyles.font14DarkBrownRegular,
                  ),
                  verticalSpace(52),
                  Text("Password", style: TextStyles.font15DarkBrownMedium),
                  verticalSpace(3.0),
                  AppTextFormField(
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.visibility,
                        size: 22.r,
                        color: ColorsManager.ligthBrown,
                      ),
                    ),
                    hintText: "●●●●●●●●",
                    hintStyle: TextStyle(
                      letterSpacing: 5,
                      color: ColorsManager.lightBeigepink,
                    ),
                    validator: (value) {},
                  ),
                  verticalSpace(16.0),
                  Text(
                    "Confirm Password",
                    style: TextStyles.font15DarkBrownMedium,
                  ),
                  verticalSpace(3.0),
                  AppTextFormField(
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.visibility,
                        size: 22.r,
                        color: ColorsManager.ligthBrown,
                      ),
                    ),
                    hintText: "●●●●●●●●",
                    hintStyle: TextStyle(
                      letterSpacing: 5,
                      color: ColorsManager.lightBeigepink,
                    ),
                    validator: (value) {},
                  ),
                ],
              ),
            ),
            verticalSpace(49.88),
            AppTextButton(
              width: 212.w,
              text: "Reset Password",
              onTap: () {
                //context.pushNamed(Routes.setPassword);
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar _loginAppBar(BuildContext context) => AppBar(
    title: Text(
      textScaler: TextScaler.linear(1.0),
      "Set Password",
      style: TextStyles.font20LigthPinkSemiBold(context),
    ),
    centerTitle: true,
  );
}
