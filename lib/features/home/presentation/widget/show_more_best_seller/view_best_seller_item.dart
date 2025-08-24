import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/features/home/domain/entities/best_seller_entity.dart';

class ViewBestSellerItem extends StatelessWidget {
  final BestSellerEntity bestSellerEntity;
  const ViewBestSellerItem({super.key, required this.bestSellerEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: context.screenHeight / 80,
        right: context.screenWidth / 35,
        left: context.screenWidth / 35,
      ),
      decoration: BoxDecoration(
        color: ColorsManager.ligthPink,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 4,
            left: 20,
            child: SizedBox(
              height: context.screenHeight / 6.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      minWidth: context.screenWidth / 2.4,
                    ),
                    child: Text(
                      textScaler: TextScaler.linear(1.0),

                      overflow: TextOverflow.ellipsis,
                      bestSellerEntity.name ?? "Kitchen Cart",
                      style: TextStyles.font20DarkTaupeMedium,
                    ),
                  ),

                  Container(
                    constraints: BoxConstraints(
                      maxWidth: context.screenWidth / 2.2,
                      maxHeight: context.screenHeight / 10,
                    ),
                    child: Text(
                      textScaler: TextScaler.linear(1.0),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      bestSellerEntity.description ??
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                      style: TextStyles.font15DarkTaupeLight.copyWith(
                        fontSize: 13.sp,
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsetsDirectional.only(
                          end: context.screenWidth / 95,
                        ),
                        width: context.screenWidth / 8,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                size: 20,
                                color: Colors.amberAccent,
                              ),
                              Text(
                                textScaler: TextScaler.linear(1.0),
                                "${bestSellerEntity.rate ?? 4.0}",
                                style: TextStyles.font14DarkTaupeRegular,
                              ),
                            ],
                          ),
                        ),
                      ),
                      horizontalSpace(52),
                      Container(
                        padding: EdgeInsetsDirectional.only(top: 2.h),
                        width: context.screenWidth / 6.7,
                        height: context.screenHeight / 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Center(
                          child: Text(
                            textScaler: TextScaler.linear(1.0),
                            "Shop Now",
                            style: TextStyles.font11DarkTaupeRegular,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Align(
            heightFactor: 0.7,

            alignment: Alignment.centerRight,
            child: Image.network(
              height: 120.h,
              width: 130.w,

              bestSellerEntity.image.toString(),

              // fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
