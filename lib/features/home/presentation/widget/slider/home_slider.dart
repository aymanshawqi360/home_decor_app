import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor_app/core/helper/app_assets.dart';
import 'package:home_decor_app/features/home/presentation/cubit/cubit/slider_cubit.dart';
import 'package:home_decor_app/features/home/presentation/cubit/cubit/slider_state.dart';
import 'package:home_decor_app/features/home/presentation/widget/slider/slider_shimmer_loading.dart';
import 'package:home_decor_app/features/home/presentation/widget/slider/slider_page_view_success.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 7.6,
      child: BlocBuilder<SliderCubit, SliderState>(
        buildWhen:
            (previous, current) =>
                current is SliderLoading ||
                current is SliderSuccess ||
                current is SliderFailure,
        builder: (context, state) {
          switch (state.runtimeType) {
            case SliderLoading:
              final sliderLoadingLength = state as SliderLoading;
              return Center(
                child: SliderShimmerLoading(
                  sliderList: sliderLoadingLength.silderLoadingLength,
                ),
              );
            case SliderSuccess:
              final sliderState = state as SliderSuccess;
              return SliderPageViewSuccess(sliderState.sliderList);

            case SliderFailure:
              //  final failureState = state as SliderFailure;
              return Center(
                child: AspectRatio(
                  aspectRatio: 16 / 7,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      AppAssets.imageAndSvg.imageNotAvailable,

                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            default:
              return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
