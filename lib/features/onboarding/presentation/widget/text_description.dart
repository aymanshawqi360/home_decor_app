import 'package:flutter/material.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/features/onboarding/dowmin/entities/onboarding_modle.dart';

class TextDescription extends StatelessWidget {
  final OnboardingModle onboardingModle;
  const TextDescription({super.key, required this.onboardingModle});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      onboardingModle.descriptions!,

      style: TextStyles.font10DarkGrayishBrownMedium,
    );
  }
}
