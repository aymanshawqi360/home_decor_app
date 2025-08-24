import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_decor_app/core/di/dependency_injection.dart';
import 'package:home_decor_app/core/helper/app_assets.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/features/favorite/presentation/pages/favorite_screen.dart';
import 'package:home_decor_app/features/home/presentation/cubit/best_seller/best_seller_cubit.dart';
import 'package:home_decor_app/features/home/presentation/cubit/categories/categories_cubit.dart';
import 'package:home_decor_app/features/home/presentation/cubit/cubit/slider_cubit.dart';
import 'package:home_decor_app/features/home/presentation/cubit/new_collection/new_collection_cubit.dart';
import 'package:home_decor_app/features/home/presentation/pages/home_screen.dart';

class ButtonNavigateBetweenScreen extends StatefulWidget {
  const ButtonNavigateBetweenScreen({super.key});

  @override
  State<ButtonNavigateBetweenScreen> createState() =>
      _ButtonNavigateBetweenScreenState();
}

class _ButtonNavigateBetweenScreenState
    extends State<ButtonNavigateBetweenScreen> {
  List<Widget> pages = [
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<SliderCubit>()..getSlider()),

        BlocProvider(
          create: (context) => getIt<CategoriesCubit>()..getCategories(),
        ),
        BlocProvider(
          create: (context) => getIt<BestSellerCubit>()..getBestSellet(),
        ),

        BlocProvider(
          create: (context) => getIt<NewCollectionCubit>()..getNewCollection(),
        ),
      ],
      child: HomeScreen(),
    ),
    Container(color: Colors.amber),
    FavoriteScreen(),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 58.h,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navigationBar(0, AppAssets.imageAndSvg.homeIcon),
            navigationBar(1, AppAssets.imageAndSvg.ligthPinkCategories),
            navigationBar(4, AppAssets.imageAndSvg.cartIcon),
            navigationBar(2, AppAssets.imageAndSvg.wishlistIcon),
            navigationBar(3, AppAssets.imageAndSvg.profileIcon),
          ],
        ),
      ),
      body: pages[index],
    );
  }

  Widget navigationBar(int pageNumber, String image) {
    return GestureDetector(
      onTap: () {
        setState(() {
          index = pageNumber;
        });
      },
      child:
          index != pageNumber
              ? SvgPicture.asset(image)
              : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(image, color: ColorsManager.darkBrown),
                  verticalSpace(5),
                  Container(
                    width: MediaQuery.sizeOf(context).width / 22,
                    height: MediaQuery.sizeOf(context).height / 350,
                    decoration: BoxDecoration(
                      color: ColorsManager.darkBrown,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                ],
              ),
    );
  }
}
