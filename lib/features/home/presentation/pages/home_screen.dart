import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_decor_app/core/helper/app_assets.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/features/home/presentation/widget/container_best_seller.dart';
import 'package:home_decor_app/features/home/presentation/widget/grid_view_new_collection.dart';
import 'package:home_decor_app/features/home/presentation/widget/home_slider.dart';
import 'package:home_decor_app/features/home/presentation/widget/list_view_categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _loginAppBar(context),
      body: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 20.h),
        child: Column(
          children: [
            HomeSlider(),
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
                ListViewCategories(),
                verticalSpace(13.0),
                Text(
                  textScaler: TextScaler.linear(1.0),
                  "Best Seller",
                  style: TextStyles.font15LigthBrownSemiBold,
                ),
                verticalSpace(28.0),
                ContainerBestSeller(),
                verticalSpace(20.0),
                Text(
                  textScaler: TextScaler.linear(1.0),
                  "New Collection",
                  style: TextStyles.font15LigthBrownSemiBold,
                ),
              ],
            ),
            verticalSpace(10),
            GridViewNewCollection(),
          ],
        ),
      ),
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
              child: SvgPicture.asset(
                AppAssets.imageAndSvg.searchIcon,
                width: context.screenWidth / 40,
                height: context.screenHeight / 40,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
