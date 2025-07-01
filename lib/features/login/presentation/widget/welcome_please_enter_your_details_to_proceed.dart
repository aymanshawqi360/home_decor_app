import 'package:flutter/material.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/styles.dart';

class WelcomePleaseEnterYourDetailsToProceed extends StatelessWidget {
  const WelcomePleaseEnterYourDetailsToProceed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
