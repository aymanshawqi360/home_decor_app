import 'package:flutter/material.dart';
import 'package:home_decor_app/core/theme/styles.dart';

class CaregoriesAndShowMore extends StatelessWidget {
  const CaregoriesAndShowMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Categories", style: TextStyles.font15LigthBrownSemiBold),
        Text("Show morw", style: TextStyles.font12DarkGrayMedium),
      ],
    );
  }
}
