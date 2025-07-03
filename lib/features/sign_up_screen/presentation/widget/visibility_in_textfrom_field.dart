// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VisibilityInTextFromField extends StatelessWidget {
  final bool? isBool;
  final void Function()? onTap;
  const VisibilityInTextFromField({Key? key, this.isBool, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(Icons.visibility, size: 22.r),
    );
  }
}
