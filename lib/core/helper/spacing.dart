import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SizedBox verticalSpace(double height) => SizedBox(height: height.h);

SizedBox horizontalSpace(double width) => SizedBox(width: width.w);

double mediaQueryWidth(BuildContext context) =>
    MediaQuery.sizeOf(context).width;
double mediaQueryHeight(BuildContext context) =>
    MediaQuery.sizeOf(context).height;
