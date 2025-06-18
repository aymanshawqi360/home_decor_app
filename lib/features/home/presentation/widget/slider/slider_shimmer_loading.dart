import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/features/home/domain/entities/slider_entity.dart';
import 'package:redacted/redacted.dart';

class SliderShimmerLoading extends StatelessWidget {
  final List<SliderEntity> sliderList;
  const SliderShimmerLoading({super.key, required this.sliderList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 6,
          child: PageView.builder(
            itemCount: sliderList.isEmpty ? 1 : sliderList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsetsDirectional.only(start: 5.w),
                child: Container(
                  width: context.screenWidth,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ).redacted(
                  context: context,
                  redact: true,

                  configuration: RedactedConfiguration(
                    animationDuration: const Duration(milliseconds: 800),
                  ),
                ),
              );
            },
          ),
        ),
        verticalSpace(20),
        slider(index: sliderList.length, context: context),
      ],
    );
  }

  slider({required int index, required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < (index == 0 ? 4 : index); i++)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            width: 20.w,
            height: 4.h,
            decoration: BoxDecoration(
              color:
                  i == index
                      ? ColorsMananger.ligthPink
                      : ColorsMananger.darkGrayishBrown,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ).redacted(
            context: context,
            redact: true,
            configuration: RedactedConfiguration(
              animationDuration: const Duration(milliseconds: 800), //default
            ),
          ),
      ],
    );
  }
}
