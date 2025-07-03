import 'package:flutter/widgets.dart';
import 'package:home_decor_app/core/theme/styles.dart';

class AppOrSignUpWith extends StatelessWidget {
  const AppOrSignUpWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.sizeOf(context).height / 80,
        right: MediaQuery.sizeOf(context).width / 70,
      ),
      child: Text(
        textScaler: TextScaler.linear(1.0),
        "or sign up with",
        style: TextStyles.font13DarkGrayishBrownLight(context),
      ),
    );
  }
}
