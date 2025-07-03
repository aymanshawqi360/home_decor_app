// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:home_decor_app/features/sign_up_screen/presentation/cubit/cubit/sign_up_cubit.dart';

class VisibilityInTextFromField extends StatefulWidget {
  final bool? isBool;
  final void Function()? onTap;
  const VisibilityInTextFromField({Key? key, this.isBool, this.onTap})
    : super(key: key);

  @override
  State<VisibilityInTextFromField> createState() =>
      _VisibilityInTextFromFieldState();
}

class _VisibilityInTextFromFieldState extends State<VisibilityInTextFromField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Icon(Icons.visibility, size: 22.r),
    );
  }
}
