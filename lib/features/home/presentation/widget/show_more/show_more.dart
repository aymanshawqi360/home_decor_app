import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/features/home/domain/entities/categories_entity.dart';

class ShowMore extends StatelessWidget {
  final CategoriesEntity category;
  const ShowMore({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: context.screenHeight / 5.5,
      decoration: BoxDecoration(
        color: ColorsManager.ligthBrown,
        borderRadius: BorderRadius.circular(8),
      ),
      child: CachedNetworkImage(
        imageUrl: category.icon.toString(),
        color: ColorsManager.linen,

        errorWidget: (context, url, error) {
          return Icon(Icons.error, color: Colors.red);
        },
      ),
    );
  }
}
