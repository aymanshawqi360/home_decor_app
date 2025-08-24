import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/constants/list_onboarding_description.dart';
import 'package:home_decor_app/core/helper/counter_change_notifier.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/features/onboarding/presentation/widget/buttom_navigate.dart';
import 'package:home_decor_app/features/onboarding/presentation/widget/onboarding_frame_image_and_arrow_right.dart';
import 'package:home_decor_app/features/onboarding/presentation/widget/text_description.dart';
import 'package:home_decor_app/features/onboarding/presentation/widget/text_title.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    CounterChangeNotifier.counterChangeNotifier.controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    CounterChangeNotifier.counterChangeNotifier.controller;
    super.dispose();
  }

  // final listOnboarding = ListOnboardingDescription.listOnboarding;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: CounterChangeNotifier.counterChangeNotifier.controller,
        itemCount: ListOnboardingDescription.listOnboarding.length,
        itemBuilder: (context, index) {
          final listOnboarding =
              ListOnboardingDescription.listOnboarding[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 29.h),
            child: Column(
              children: [
                OnboardingFrameAndImageAndArrowRight(
                  image: listOnboarding.image.toString(),
                  lenghtList: ListOnboardingDescription.listOnboarding.length,
                ),
                verticalSpace(76),

                TextTitle(onboardingModle: listOnboarding),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 26.h,
                  ),
                  child: TextDescription(onboardingModle: listOnboarding),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      onboardingButtom(index: index),
                      ButtomNavigate(index: index),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget onboardingButtom({required int index}) {
    return Row(
      children: [
        for (int i = 0; i < 4; i++)
          Padding(
            padding: EdgeInsetsDirectional.only(start: 7.w),
            child: Container(
              width: index == i ? 36.w : 12.w,
              height: 7.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.r),
                color:
                    index == i ? ColorsManager.ligthPink : ColorsManager.linen,
              ),
            ),
          ),
      ],
    );
  }
}
