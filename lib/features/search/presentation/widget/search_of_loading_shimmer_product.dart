import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:redacted/redacted.dart';

class SearchOfLoadingShimmerProduct extends StatelessWidget {
  const SearchOfLoadingShimmerProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: context.screenWidth,
          height: context.screenHeight / 12,
          constraints: BoxConstraints(maxHeight: context.screenHeight / 7),

          color: Colors.grey,
        ),
        verticalSpace(5),
        Padding(
          padding: EdgeInsets.only(left: 6.w, right: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                textScaler: TextScaler.linear(1.0),
                "Aluminum chair",
                style: TextStyles.font15DarkBrownMedium,
              ),
              verticalSpace(3),
              Container(
                height: context.screenHeight / 42,

                constraints: BoxConstraints(
                  maxHeight: context.screenHeight / 42,
                ),
                child: Text(
                  textScaler: TextScaler.linear(1.0),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,

                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                  style: TextStyles.font12DarkTaupeLight,
                ),
              ),

              const Divider(color: ColorsMananger.ligthPink),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textScaler: TextScaler.linear(1.0),

                    "\$${120.0}",
                    style: TextStyles.font15LigthBrownMedium,
                  ),

                  Row(
                    children: [
                      Container(
                        width: context.screenWidth / 16,
                        height: context.screenHeight / 34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      horizontalSpace(5.23),
                      Container(
                        width: context.screenWidth / 16,
                        height: context.screenHeight / 34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ).redacted(
      context: context,
      redact: true,
      configuration: RedactedConfiguration(
        animationDuration: const Duration(milliseconds: 800),
      ),
    );
  }
}
