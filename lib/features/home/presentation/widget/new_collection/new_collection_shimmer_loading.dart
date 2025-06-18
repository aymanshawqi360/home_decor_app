import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/core/widgets/app_grid_view.dart';
import 'package:redacted/redacted.dart';

class NewCollectionShimmerLoading extends StatelessWidget {
  const NewCollectionShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGridView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      scrollPhysics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 23,
        mainAxisSpacing: 15,
        // mainAxisExtent: 250,
        mainAxisExtent: 190,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              width: context.screenWidth,
              height: 80,
              constraints: BoxConstraints(maxHeight: context.screenHeight / 7),
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

                  Divider(color: ColorsMananger.ligthPink),

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
                            width: context.screenWidth / 18,
                            height: context.screenHeight / 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          horizontalSpace(5.23),

                          Container(
                            width: context.screenWidth / 18,
                            height: context.screenHeight / 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
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
      },
    );
  }
}
