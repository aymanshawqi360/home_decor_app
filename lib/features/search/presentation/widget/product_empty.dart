import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:lottie/lottie.dart';

class ProductEmpty extends StatelessWidget {
  const ProductEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(100),
        Center(
          child: Lottie.asset(
            "assets/lottie/animation_product.json",
            height: context.screenHeight / 2.8,
          ),
        ),
        Text(
          "not product avaolable",
          style: TextStyle(
            color: Colors.red,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
