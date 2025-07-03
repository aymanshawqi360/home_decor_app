import 'package:flutter/widgets.dart';
import 'package:home_decor_app/core/theme/styles.dart';

class AppDoYouHaveAccound extends StatelessWidget {
  final void Function()? onTap;
  final String? accound;
  final String? loginOrSingUp;
  const AppDoYouHaveAccound({
    super.key,
    this.onTap,
    this.accound,
    this.loginOrSingUp,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: accound,
              style: TextStyles.font13DarkGrayishBrownLight(context),
            ),
            TextSpan(
              text: loginOrSingUp,
              style: TextStyles.font13LigthBrownLight(context),
            ),
          ],
        ),
      ),
    );
  }
}

//  context.pushNamedAndRemoveUntil(Routes.login, predicate: (_) => false);

// Already have an account?
// "Login",
