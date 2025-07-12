import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';

class AppTextFormField extends StatelessWidget {
  final double? horizontal;
  final double? vertical;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final Widget? suffixIcon;
  final Color? fillColor;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool? obscureText;
  final Function(String?)? validator;
  final Color? cursorColor;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final bool? autofocus;
  const AppTextFormField({
    super.key,
    this.horizontal,
    this.vertical,
    this.suffixIcon,
    this.fillColor,
    this.hintText,
    this.hintStyle,
    this.obscureText,
    this.validator,
    this.cursorColor,
    this.focusedBorder,
    this.enabledBorder,
    this.contentPadding,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.autofocus,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus ?? false,
      controller: controller,
      style: TextStyle(color: ColorsMananger.darkGrayishBrown),
      cursorColor: cursorColor ?? ColorsMananger.darkGrayishBrown,
      decoration: InputDecoration(
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 26.w, vertical: 14.h),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: ColorsMananger.linen, width: 2.0),
              borderRadius: BorderRadius.circular(25),
            ),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: ColorsMananger.linen, width: 2.0),
              borderRadius: BorderRadius.circular(25),
            ),

        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 0.8),

          borderRadius: BorderRadius.circular(25),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 0.8),

          borderRadius: BorderRadius.circular(25),
        ),
        suffixIcon: suffixIcon,

        isDense: true,
        filled: true,
        fillColor: fillColor ?? ColorsMananger.linen,

        hintText: hintText ?? "example@example.com",
        hintStyle: hintStyle ?? TextStyles.font14LightBeigepinkRegular(context),
      ),
      obscureText: obscureText ?? false,

      validator: (value) {
        return validator!(value);
      },
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
