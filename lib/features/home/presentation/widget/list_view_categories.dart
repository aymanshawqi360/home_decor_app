import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/theme/colors.dart';

class ListViewCategories extends StatelessWidget {
  const ListViewCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66.0.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0.w : 15.w),
            child: Container(
              width: 64.0.w,
              height: 64.0.h,
              decoration: BoxDecoration(
                color: ColorsMananger.lightBeigepink,
                borderRadius: BorderRadius.circular(13.r),
              ),
            ),
          );
        },
      ),
    );
  }
}
