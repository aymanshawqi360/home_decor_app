import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';

class GridViewNewCollection extends StatelessWidget {
  const GridViewNewCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 23,
        mainAxisSpacing: 15,

        mainAxisExtent: 250,
      ),
      itemBuilder: (context, index) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: context.screenWidth,

                constraints: BoxConstraints(
                  maxHeight: context.screenHeight / 7,
                ),

                color: Colors.amber,
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
                    Text(
                      textScaler: TextScaler.linear(1.0),
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                      style: TextStyles.font12DarkTaupeLight,
                    ),
                    Divider(color: ColorsManager.ligthPink),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          textScaler: TextScaler.linear(1.0),

                          "\$${120.00}",
                          style: TextStyles.font15LigthBrownMedium,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: ColorsManager.ligthPink,
                              maxRadius: 13,
                              minRadius: 13,
                              child: Center(
                                child: Icon(
                                  Icons.favorite_rounded,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            horizontalSpace(5.23),
                            CircleAvatar(
                              backgroundColor: ColorsManager.ligthPink,
                              radius: 13,
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.white,
                                ),
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
          ),
        );
      },
    );
  }
}
