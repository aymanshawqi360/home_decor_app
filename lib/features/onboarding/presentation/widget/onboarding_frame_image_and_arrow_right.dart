import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_decor_app/core/helper/app_assets.dart';
import 'package:home_decor_app/core/helper/counter_change_notifier.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';

class OnboardingFrameAndImageAndArrowRight extends StatelessWidget {
  final String image;
  final int lenghtList;
  const OnboardingFrameAndImageAndArrowRight({
    super.key,
    required this.image,
    required this.lenghtList,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 480.h,

          decoration: BoxDecoration(
            color: ColorsManager.linen,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(34.r)),
          ),
        ),

        SizedBox(
          height: 450.h,
          width: double.infinity,
          child: Image.asset(image, fit: BoxFit.fill),
        ),

        GestureDetector(
          onTap: () {
            CounterChangeNotifier.counterChangeNotifier.counterSkip(
              lenght: lenghtList,
            );
          },
          child:
              CounterChangeNotifier.counterChangeNotifier.counter == 3
                  ? SizedBox.shrink()
                  : Padding(
                    padding: EdgeInsets.only(top: 71.h, right: 20.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Skip", style: TextStyles.font14DarkTaupeRegular),
                        horizontalSpace(7.0),
                        SvgPicture.asset(
                          AppAssets.imageAndSvg.arrowRight,
                          height: 18,
                          width: 18,

                          // width: 14.w,
                          // height: 14.h,
                        ),
                      ],
                    ),
                  ),
        ),
      ],
    );
  }
}
