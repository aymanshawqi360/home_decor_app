import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/features/home/presentation/widget/container_best_seller.dart';
import 'package:home_decor_app/features/home/presentation/widget/grid_view_new_collection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> items = [
    Container(
      // height: 50.h,
      width: 349.w,
      decoration: BoxDecoration(color: Colors.grey),
      child: Text("1"),
    ),
    Container(
      // height: 50.h,
      width: 349.w,
      decoration: BoxDecoration(color: Colors.grey),
      child: Text("2"),
    ),
    Container(
      // height: 50.h,
      width: 349.w,
      decoration: BoxDecoration(color: Colors.grey),
      child: Text("3"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _loginAppBar(context),
      body: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 20.h),
        child: Column(
          children: [
            Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 138.0.h,
                    viewportFraction: 1,
                    scrollDirection: Axis.horizontal,
                  ),

                  items:
                      [0, 1, 2].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Padding(
                              padding: EdgeInsetsDirectional.only(start: 5.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 124.h,
                                // margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                                // child: Text(
                                //   'text $i',
                                //   style: TextStyle(fontSize: 16.0),
                                // ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                    left: MediaQuery.of(context).size.width / 3,
                  ),
                  child: slider(index: 0),
                ),
              ],
            ),
            verticalSpace(5),

            verticalSpace(20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textScaler: TextScaler.linear(1.0),
                  "Categories",
                  style: TextStyles.font15LigthBrownSemiBold,
                ),
                verticalSpace(20),
                SizedBox(
                  height: 66.0.h,
                  child: ListView.builder(
                    // padding: EdgeInsetsDirectional.only(start: 0.w),
                    scrollDirection: Axis.horizontal,

                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsetsDirectional.only(
                          start: index == 0 ? 0.w : 15.w,
                        ),
                        child: Container(
                          //  margin: EdgeInsets.symmetric(horizontal: 10.w),
                          width: 64.0.w,
                          height: 64.0.h,
                          decoration: BoxDecoration(
                            color: ColorsMananger.lightBeigepink,
                            borderRadius: BorderRadius.circular(13.r),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                verticalSpace(13.0),
                Text(
                  textScaler: TextScaler.linear(1.0),
                  "Best Seller",
                  style: TextStyles.font15LigthBrownSemiBold,
                ),
                verticalSpace(39.0),
                ContainerBestSeller(),
                verticalSpace(20.0),
                Text(
                  textScaler: TextScaler.linear(1.0),
                  "New Collection",
                  style: TextStyles.font15LigthBrownSemiBold,
                ),
                verticalSpace(10),
              ],
            ),
            GridViewNewCollection(),
          ],
        ),
      ),
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

  AppBar _loginAppBar(BuildContext context) => AppBar(
    title: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textScaler: TextScaler.linear(1.0),
                  "Hi, Welcome Back",
                  style: TextStyles.font22LigthBrownSemiBold,
                ),
                Text(
                  textScaler: TextScaler.linear(1.0),
                  "Create spaces that bring joy",
                  style: TextStyles.font14DarkGrayishBrownRegular(context),
                ),
              ],
            ),
            CircleAvatar(
              backgroundColor: ColorsMananger.ligthPink,
              child: Icon(Icons.search),
            ),
          ],
        ),
      ],
    ),
  );
}
