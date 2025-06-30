import 'package:flutter/widgets.dart';
import 'package:home_decor_app/core/theme/styles.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "    By continuing, you agree to \n",
            style: TextStyles.font14DarkTaupeRegularLeagueSpartan,
          ),

          TextSpan(
            text: "Terms of Use",
            style: TextStyles.font14DarkTaupeSemiBoldLeagueSpartan,
          ),
          TextSpan(
            text: " and ",
            style: TextStyles.font14DarkTaupeRegularLeagueSpartan,
          ),
          TextSpan(
            text: "Privacy Policy.\n",
            style: TextStyles.font14DarkTaupeSemiBoldLeagueSpartan,
          ),
        ],
      ),
    );
  }
}
