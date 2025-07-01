import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';

class AppTextButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Decoration? decoration;
  final String? text;
  final void Function()? onTap;
  const AppTextButton({
    super.key,
    this.width,
    this.height,
    this.decoration,
    this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.sizeOf(context).height / 5,
        // 186,
        height: height ?? MediaQuery.sizeOf(context).height / 20,
        decoration:
            decoration ??
            BoxDecoration(
              color: ColorsMananger.ligthPink,
              borderRadius: BorderRadius.circular(19.r),
            ),
        child: Center(
          child: Text(
            text ?? "Log In",
            style: TextStyles.font20LigthBrownSemiBold(context),
          ),
        ),
      ),
    );
  }
}
