import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/constants/onboarding_images_and_titles_and_descriptions.dart';
import 'package:home_decor_app/core/helper/counter_change_notifier.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/features/onboarding/widget/buttom_navigate.dart';
import 'package:home_decor_app/features/onboarding/widget/onboarding_frame_image_and_arrow_right.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: CounterChangeNotifier.counterChangeNotifier.controller,
        itemCount: 4,
        itemBuilder: (context, index) {
          final listOnboarding =
              OnboardingImagesAndTitlesAndDescriptions.list[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 29.h),
            child: Column(
              children: [
                onboardingFrameAndImageAndArrowRight(
                  image: listOnboarding.image.toString(),
                ),
                verticalSpace(76),

                Text(
                  listOnboarding.title ?? "Confortable Space",
                  style: TextStyles.font25LinenSemiBold,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 26.h,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    listOnboarding.descriptions ??
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                    style: TextStyles.font10DarkGrayishBrownMedium,
                  ),
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
