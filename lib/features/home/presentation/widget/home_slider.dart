import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/theme/colors.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int n = 0;
  indexPage(int i) {
    setState(() {
      n = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 138.0.h,
            enableInfiniteScroll: false,
            viewportFraction: 1,
            scrollDirection: Axis.horizontal,
          ),
          items:
              [0, 1, 2].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    n = i;
                    return Padding(
                      padding: EdgeInsetsDirectional.only(start: 5.w),
                      child: Container(
                        width: context.screenWidth,
                        height: 124.h,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Text(i.toString()),
                      ),
                    );
                  },
                );
              }).toList(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, left: context.screenWidth / 3),

          child: slider(index: n),
        ),
      ],
    );
  }

  slider({required int index}) {
    return Row(
      children: [
        for (int i = 0; i < 3; i++)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            width: 20.w,
            height: 4.h,
            decoration: BoxDecoration(
              color:
                  i == index
                      ? ColorsMananger.ligthPink
                      : ColorsMananger.darkGrayishBrown,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
      ],
    );
  }
}
