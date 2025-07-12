import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/networks/api_constants.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/features/search/presentation/cubit/search_cubit.dart';

class WidgetSliderTheme extends StatefulWidget {
  const WidgetSliderTheme({super.key});

  @override
  State<WidgetSliderTheme> createState() => _WidgetSliderThemeState();
}

class _WidgetSliderThemeState extends State<WidgetSliderTheme> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return Column(
      children: [
        verticalSpace(14),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 7.0,
            padding: EdgeInsets.symmetric(horizontal: 7.w),
          ),
          child: Slider.adaptive(
            max:
                cubit.resultSearchPriceRangeEntit.maxPrice ??
                ApiConstants.maxPrice,
            min:
                cubit.resultSearchPriceRangeEntit.minPrice ??
                ApiConstants.minPrice,
            activeColor: ColorsMananger.ligthPink.withOpacity(1),
            inactiveColor: ColorsMananger.lightBeigepink.withOpacity(0.6),
            thumbColor: ColorsMananger.ligthBrown,
            label: "\$${cubit.maxPrice.round()}",
            overlayColor: WidgetStateColor.transparent,
            divisions: cubit.maxPrice.toInt(),
            value: cubit.maxPrice,
            onChanged: (value) {
              setState(() {
                cubit.maxPrice = value;
              });
            },
          ),
        ),
        verticalSpace(9),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$${cubit.resultSearchPriceRangeEntit.minPrice}"),
            Text("\$${cubit.resultSearchPriceRangeEntit.maxPrice}"),
          ],
        ),
      ],
    );
  }
}
