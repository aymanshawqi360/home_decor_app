import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_decor_app/core/helper/app_assets.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/routes/routes.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/core/widgets/app_page_view.dart';
import 'package:home_decor_app/features/home/presentation/cubit/categories/categories_state.dart';
import 'package:home_decor_app/features/home/presentation/widget/best_seller/best_seller_bloc_builder.dart';
import 'package:home_decor_app/features/home/presentation/widget/categories_list/categories_bloc_builder.dart';
import 'package:home_decor_app/features/home/presentation/widget/best_seller/best_seller_list_view_item.dart';
import 'package:home_decor_app/features/home/presentation/widget/new_collection/new_collection_bloc_builder.dart';
import 'package:home_decor_app/features/home/presentation/widget/new_collection/new_collection_grid_view_list.dart';
import 'package:home_decor_app/features/home/presentation/widget/show_more/caregories_and_show_more.dart';
import 'package:home_decor_app/features/home/presentation/widget/slider/home_slider.dart';

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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(
            children: [
              HomeSlider(),
              //   verticalSpace(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CaregoriesAndShowMore(),
                  verticalSpace(20),
                  CategoriesBlocBuilder(),
                  //    ListViewCategories(),
                  verticalSpace(13.0),
                  Text(
                    textScaler: TextScaler.linear(1.0),
                    "Best Seller",
                    style: TextStyles.font15LigthBrownSemiBold,
                  ),
                  verticalSpace(15),
                  BestSellerBlocBuilder(),
                  verticalSpace(20.0),
                  Text(
                    textScaler: TextScaler.linear(1.0),
                    "New Collection",
                    style: TextStyles.font15LigthBrownSemiBold,
                  ),
                ],
              ),
              verticalSpace(10),
              NewCollectionBlocBuilder(),
              // GridViewNewCollection(),
            ],
          ),
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
            GestureDetector(
              onTap: () {
                context.pushNamed(Routes.search);
              },
              child: CircleAvatar(
                backgroundColor: ColorsMananger.ligthPink,
                child: SvgPicture.asset(
                  AppAssets.imageAndSvg.searchIcon,
                  width: context.screenWidth / 40,
                  height: context.screenHeight / 40,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
