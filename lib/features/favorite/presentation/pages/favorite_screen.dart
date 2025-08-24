import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_decor_app/core/helper/app_assets.dart';
import 'package:home_decor_app/core/helper/app_string.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/features/favorite/presentation/cubit/cubit/favorite_cubit.dart';
import 'package:home_decor_app/features/favorite/presentation/widget/favorite_bloc_listener.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        actions: [
          GestureDetector(
            onTap: () {
              context.read<FavoriteCubit>().checkIconDelete();
            },
            child: SvgPicture.asset(
              AppAssets.imageAndSvg.deleteIcon,
              height: context.screenHeight / 35,
              width: context.screenWidth / 35,
            ),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: context.screenWidth / 20),
        title: Text(
          AppString.favorite,
          style: TextStyles.font20LigthBrownSemiBold,
        ),
        centerTitle: true,
      ),
      body: FavoriteBlocListener(),
    );
  }
}
