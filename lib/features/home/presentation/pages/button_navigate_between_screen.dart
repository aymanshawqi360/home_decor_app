import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_decor_app/core/di/dependency_injection.dart';
import 'package:home_decor_app/core/helper/app_assets.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/features/home/presentation/cubit/cubit/slider_cubit.dart';
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
    BlocProvider(
      create: (context) => SliderCubit(getIt())..getSlider(),
      child: HomeScreen(),
    ),
    Container(color: Colors.amber),
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],

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
                  SvgPicture.asset(image, color: ColorsMananger.darkBrown),
                  verticalSpace(5),
                  Container(
                    width: MediaQuery.sizeOf(context).width / 22,
                    height: MediaQuery.sizeOf(context).height / 350,
                    decoration: BoxDecoration(
                      color: ColorsMananger.darkBrown,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                ],
              ),
    );
  }
}
