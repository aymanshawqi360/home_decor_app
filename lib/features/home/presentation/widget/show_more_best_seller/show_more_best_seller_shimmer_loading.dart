import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/widgets/app_list_view.dart';
import 'package:redacted/redacted.dart';

class ShowMoreBestSellerShimmerLoading extends StatelessWidget {
  const ShowMoreBestSellerShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: context.screenWidth / 35,
        left: context.screenWidth / 35,
      ),
      child: AppListView(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsetsDirectional.only(
              bottom: context.screenHeight / 70,
            ),

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
