import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_decor_app/core/helper/app_assets.dart';
import 'package:home_decor_app/core/helper/app_string.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/features/favorite/presentation/cubit/cubit/favorite_cubit.dart';

class AppBarFavorite extends StatelessWidget implements PreferredSizeWidget {
  const AppBarFavorite({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
