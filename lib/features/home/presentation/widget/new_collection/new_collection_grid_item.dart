import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/features/home/domain/entities/new_collection_entity.dart';

class NewCollectionGridItem extends StatelessWidget {
  final NewCollectionEntity newCollectionEntity;
  const NewCollectionGridItem({super.key, required this.newCollectionEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: context.screenWidth,
          height: 100,
          child: CachedNetworkImage(
            imageUrl: newCollectionEntity.image.toString(),
            // height: context.screenHeight / 12,
            placeholder: (context, url) {
              return Container(
                width: context.screenWidth,

                constraints: BoxConstraints(
                  maxHeight: context.screenHeight / 7,
                ),

                color: Colors.grey.shade200,
              );
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
                newCollectionEntity.name ?? "Aluminum chair",
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
                  newCollectionEntity.description ??
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

                    "\$${newCollectionEntity.salePrice ?? 120.0}",
                    style: TextStyles.font15LigthBrownMedium,
                  ),

                  Row(
                    children: [
                      CircleAvatar(
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
                      CircleAvatar(
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
