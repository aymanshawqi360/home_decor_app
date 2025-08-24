import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/features/home/domain/entities/slider_entity.dart';
import 'package:home_decor_app/features/home/presentation/cubit/cubit/slider_cubit.dart';
import 'package:home_decor_app/features/home/presentation/cubit/cubit/slider_state.dart';
import 'package:home_decor_app/features/home/presentation/widget/slider/silder_page.dart';

class SliderPageViewSuccess extends StatefulWidget {
  final List<SliderEntity> _sliderList;
  const SliderPageViewSuccess(this._sliderList, {super.key});

  @override
  State<SliderPageViewSuccess> createState() => _SliderPageViewSuccessState();
}

class _SliderPageViewSuccessState extends State<SliderPageViewSuccess> {
  late PageController _controller;
  // late ScrollPhysics scrollPhysics;

  int timerIndex = 0;
  bool isScrollPhysics = true;
  @override
  void initState() {
    //context.read<SliderCubit>().getSlider();
    _controller = PageController();
    // scrollPhysics = ScrollPhysics();
    // WidgetsBinding.instance.addPersistentFrameCallback((_) {
    // });
    _pageViewTimer();
    super.initState();
  }

  _pageViewTimer() {
    int lastSilder = 0;
    Timer.periodic(Duration(seconds: 3), (_) {
      if (!_controller.hasClients) return;
      if (timerIndex < widget._sliderList.length - 1) {
        timerIndex++;
        _controller.animateToPage(
          timerIndex,
          duration: Duration(milliseconds: 500),
          curve:
              timerIndex == lastSilder ? Curves.easeInExpo : Curves.easeInOut,
        );
      } else {
        timerIndex = (widget._sliderList.length - 1) - timerIndex;
        _controller.jumpToPage(timerIndex);
      }
      context.read<SliderCubit>().sliderWithTimerForPagView(timerIndex);
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 6,
          child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            itemCount: widget._sliderList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SilderPage(sliderEntity: widget._sliderList[index]);
            },
          ),
        ),
        verticalSpace(20),

        slider(index: widget._sliderList.length),
      ],
    );
  }

  slider({required int index}) {
    return BlocBuilder<SliderCubit, SliderState>(
      buildWhen: (previous, current) => current is SliderWithTimer,
      builder: (context, state) {
        final slider = state is SliderWithTimer ? state.timer : 0;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget._sliderList.length; i++)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                width: 20.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color:
                      i == slider
                          ? ColorsManager.ligthPink
                          : ColorsManager.darkGrayishBrown,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
          ],
        );
      },

      // else {
      //   return Text("data", style: TextStyle(color: Colors.amber));
      // }
    );
  }
}
