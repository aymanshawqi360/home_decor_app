import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/networks/api_constants.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/features/search/domain/entity/search_response_model_entity.dart';

class ProductItem extends StatelessWidget {
  final SearchResponseModelEntity productItem;
  const ProductItem({super.key, required this.productItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: context.screenWidth,
          // height: context.screenHeight / 12,
          child: CachedNetworkImage(
            imageUrl: "${ApiConstants.baseUrlImage}${productItem.image}",
            height: context.screenHeight / 12,
            placeholder: (context, url) {
              return Container(
                width: context.screenWidth,

                constraints: BoxConstraints(
                  maxHeight: context.screenHeight / 7,
                ),

                color: Colors.grey.shade200,
              );
            },
            errorWidget: (context, url, error) {
              return Icon(Icons.wifi_tethering_error, color: Colors.red);
            },
          ),
        ),
        verticalSpace(5),
        Padding(
          padding: EdgeInsets.only(left: 6.w, right: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                textScaler: TextScaler.linear(1.0),
                productItem.name ?? "Aluminum chair",
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
                  productItem.description ??
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

                    "\$${productItem.salePrice ?? 120.0}",
                    style: TextStyles.font15LigthBrownMedium,
                  ),

                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: ColorsMananger.ligthPink,
                        maxRadius: 13,
                        minRadius: 13,
                        child: Center(
                          child: Icon(
                            Icons.favorite_rounded,
                            size: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      horizontalSpace(5.23),
                      const CircleAvatar(
                        backgroundColor: ColorsMananger.ligthPink,
                        radius: 13,
                        child: Center(
                          child: Icon(Icons.add, size: 20, color: Colors.white),
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
    );
  }
}
