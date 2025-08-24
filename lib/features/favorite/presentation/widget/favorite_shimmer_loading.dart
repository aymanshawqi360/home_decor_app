import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_decor_app/core/helper/app_assets.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/widgets/app_button_favorite.dart';
import 'package:redacted/redacted.dart';

class FavoriteShimmerLoading extends StatelessWidget {
  const FavoriteShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth / 20),

      //  color: Colors.blue,
      child: Row(
        children: [
          Container(
            width: context.screenWidth / 3.4,
            height: context.screenHeight / 6,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          ),
          horizontalSpace(context.screenWidth / 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ddddddddddddddd"),
              verticalSpace(7),
              Text("ddddddddddddddd"),
            ],
          ),
        ],
      ).redacted(
        context: context,
        redact: true,
        configuration: RedactedConfiguration(
          animationDuration: const Duration(milliseconds: 800),
        ),
      ),
    );
  }
}
