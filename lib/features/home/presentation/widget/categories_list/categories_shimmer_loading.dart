import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:redacted/redacted.dart';

class CategoriesShimmerLoading extends StatelessWidget {
  const CategoriesShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight / 9.5,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 1.w : 16.w),
            child: Column(
              children: [
                categoriesList(index, context),
                verticalSpace(7),
                _categoryName(),
              ],
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
    );
  }

  Widget categoriesList(int index, BuildContext context) {
    return Container(
      width: context.screenWidth / 6,
      height: context.screenHeight / 13.5,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(13.r),
      ),
    );
  }

  Widget _categoryName() =>
      Text("Shimmer", style: TextStyles.font12LigthBrownSemiBold);
}
