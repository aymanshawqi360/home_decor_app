import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/features/home/domain/entities/slider_entity.dart';

class SilderPage extends StatelessWidget {
  final SliderEntity sliderEntity;
  const SilderPage({super.key, required this.sliderEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: sliderEntity.image!,

          fit: BoxFit.contain,
          placeholder: (context, url) {
            return Padding(
              padding: EdgeInsetsDirectional.only(start: 8.w),
              child: Container(
                width: context.screenWidth,

                decoration: BoxDecoration(
                  color: Colors.grey.shade200,

                  // color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
