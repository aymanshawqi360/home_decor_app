import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/app_assets.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/core/widgets/app_text_form_field.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: "Search",
      hintStyle: TextStyles.font13darkGrayLight,
      fillColor: Colors.white,
      suffixIcon: Transform.scale(
        scale: 0.7,
        child: CircleAvatar(
          backgroundColor: ColorsMananger.ligthPink,

          child: Image.asset(
            AppAssets.imageAndSvg.filter,
            scale: 3.sp,
            color: ColorsMananger.darkBrown,
          ),
        ),
      ),
      contentPadding: EdgeInsets.only(
        left: 12.w,
        right: 5.w,
        top: 10.h,
        bottom: 9.h,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r),
        borderSide: BorderSide(color: ColorsMananger.ligthBrown, width: 1.3),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r),
        borderSide: BorderSide(color: ColorsMananger.ligthBrown, width: 1.3),
      ),
      validator: (value) {},
    );
  }
}
