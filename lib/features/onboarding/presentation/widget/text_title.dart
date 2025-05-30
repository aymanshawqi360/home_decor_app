// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:home_decor_app/core/theme/styles.dart';

import 'package:home_decor_app/features/onboarding/dowmin/entities/onboarding_modle.dart';

class TextTitle extends StatelessWidget {
  final OnboardingModle onboardingModle;
  const TextTitle({Key? key, required this.onboardingModle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      onboardingModle.title ?? "Confortable Space",
      style: TextStyles.font25LinenSemiBold,
    );
  }
}
