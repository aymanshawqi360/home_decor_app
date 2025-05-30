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

  final listOnboarding = OnboardingImagesAndTitlesAndDescriptions.list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: CounterChangeNotifier.counterChangeNotifier.controller,
<<<<<<< HEAD:lib/features/onboarding/presentation/pages/onboarding_screen.dart
        itemCount: ListOnboardingDescription.listOnboarding.length,
        itemBuilder: (context, index) {
          final listOnboarding =
              ListOnboardingDescription.listOnboarding[index];
=======
        itemCount: listOnboarding.length,
        itemBuilder: (context, index) {
          final listIndex = listOnboarding[index];
>>>>>>> features/login_ui:lib/features/onboarding/onboarding_screen.dart
          return Padding(
            padding: EdgeInsets.only(bottom: 29.h),
            child: Column(
              children: [
                OnboardingFrameAndImageAndArrowRight(
                  image: listIndex.image.toString(),
                  lenghtList: listOnboarding.length,
                ),
                verticalSpace(76),

<<<<<<< HEAD:lib/features/onboarding/presentation/pages/onboarding_screen.dart
                TextTitle(onboardingModle: listOnboarding),
=======
                Text(
                  listIndex.title ?? "Confortable Space",
                  style: TextStyles.font25LinenSemiBold,
                ),
>>>>>>> features/login_ui:lib/features/onboarding/onboarding_screen.dart
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 26.h,
                  ),
<<<<<<< HEAD:lib/features/onboarding/presentation/pages/onboarding_screen.dart
                  child: TextDescription(onboardingModle: listOnboarding),
=======
                  child: Text(
                    textAlign: TextAlign.center,
                    listIndex.descriptions ??
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                    style: TextStyles.font10DarkGrayishBrownMedium,
                  ),
>>>>>>> features/login_ui:lib/features/onboarding/onboarding_screen.dart
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
                    index == i
                        ? ColorsMananger.ligthPink
                        : ColorsMananger.linen,
              ),
            ),
          ),
      ],
    );
  }
}
