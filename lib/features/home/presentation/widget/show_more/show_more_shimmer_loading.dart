import 'package:flutter/material.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/core/widgets/app_grid_view.dart';
import 'package:redacted/redacted.dart';

class ShowMoreShimmerLoading extends StatelessWidget {
  const ShowMoreShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              width: context.screenWidth,
              height: context.screenHeight / 5.5,
              decoration: BoxDecoration(
                color: ColorsMananger.ligthBrown,
                // border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network("", color: ColorsMananger.lightBeigepink),
            ),
            verticalSpace(5),
            Text("ShimmerText", style: TextStyles.font10DarkGrayishBrownMedium),
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
