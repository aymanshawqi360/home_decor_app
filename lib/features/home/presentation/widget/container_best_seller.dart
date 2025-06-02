import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';

class ContainerBestSeller extends StatelessWidget {
  const ContainerBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 134.0.h,
      width: MediaQuery.sizeOf(context).width,

      decoration: BoxDecoration(
        color: ColorsMananger.ligthPink,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 17,
            left: 26,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textScaler: TextScaler.linear(1.0),
                  "Kitchen Cart",
                  style: TextStyles.font20DarkTaupeMedium,
                ),
                SizedBox(
                  // width: 253.w,
                  width: MediaQuery.sizeOf(context).width / 1.3,
                  child: Text(
                    textScaler: TextScaler.linear(1.0),
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                    style: TextStyles.font15DarkTaupeLight,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            left: 26,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 46.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(Icons.star_rate_rounded, size: 20),
                        Text(
                          textScaler: TextScaler.linear(1.0),
                          "4.5",
                          style: TextStyles.font14DarkTaupeRegular,
                        ),
                      ],
                    ),
                  ),
                ),
                horizontalSpace(52),
                Container(
                  width: 55.w,
                  height: 22.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Center(
                    child: Text(
                      textScaler: TextScaler.linear(1.0),
                      "Shop Now",
                      style: TextStyles.font11DarkTaupeRegular,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
