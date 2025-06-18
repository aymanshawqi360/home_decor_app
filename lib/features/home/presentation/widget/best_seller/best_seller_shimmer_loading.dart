import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/widgets/app_page_view.dart';
import 'package:redacted/redacted.dart';

class BestSellerShimmerLoading extends StatelessWidget {
  const BestSellerShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight / 5.7,
      child: AppPageView(
        physics: const PageScrollPhysics(),
        controller: PageController(viewportFraction: 1.0),

        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsetsDirectional.only(end: 5.w, top: 3.h),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: SizedBox(
              height: context.screenHeight / 6.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [],
              ),
            ),
          ).redacted(
            context: context,
            redact: true,
            configuration: RedactedConfiguration(
              animationDuration: const Duration(milliseconds: 800),
            ),
          );
        },
      ),
    );
  }
}
