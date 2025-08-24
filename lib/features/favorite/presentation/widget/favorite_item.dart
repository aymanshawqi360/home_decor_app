import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_decor_app/core/helper/app_assets.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/networks/api_constants.dart';
import 'package:home_decor_app/core/theme/colors.dart';
import 'package:home_decor_app/core/widgets/app_button_favorite.dart';
import 'package:home_decor_app/core/widgets/app_cahed_network_image.dart';
import 'package:home_decor_app/features/favorite/domain/entity/list_favorite_api_response_entity.dart';
import 'package:home_decor_app/features/favorite/presentation/cubit/cubit/favorite_cubit.dart';
import 'package:home_decor_app/features/favorite/presentation/cubit/cubit/favorite_state.dart';

class FavoriteItem extends StatelessWidget {
  final ListFavoriteApiResponseEntity favorite;
  const FavoriteItem({super.key, required this.favorite});

  @override
  Widget build(BuildContext context) {
    final cubitFavorite = context.read<FavoriteCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth / 20),
      child: Container(
        //  color: Colors.blue,
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: context.screenWidth / 3.4,
                  height: context.screenHeight / 6,
                  decoration: BoxDecoration(
                    color: ColorsManager.linen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: AppCahedNetworkImage(
                      image: "${favorite.image}",
                      fit: BoxFit.contain,
                      height: context.screenHeight / 4.0,
                      width: context.screenWidth / 4.0,
                      placeholder: Container(
                        width: context.screenWidth / 3,
                        height: context.screenHeight / 5,
                        decoration: BoxDecoration(
                          color: ColorsManager.linen,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.network(
                          "${ApiConstants.baseUrlImage}${favorite.image}",
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 5,
                  child: AppButtonFavorite(
                    onTap: () {
                      cubitFavorite.addingFavorite(
                        path: favorite.id.toString(),
                      );
                    },
                    color: ColorsManager.red,
                  ),
                ),
              ],
            ),
            horizontalSpace(context.screenWidth / 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: context.screenWidth / 2.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        "${favorite.name}",
                      ),
                      BlocBuilder<FavoriteCubit, FavoriteState>(
                        builder: (context, state) {
                          return Visibility(
                            visible: cubitFavorite.delete,
                            child: GestureDetector(
                              onTap: () {
                                cubitFavorite.addingFavorite(
                                  path: favorite.id.toString(),
                                );
                              },
                              child: SvgPicture.asset(
                                AppAssets.imageAndSvg.deleteIcon,
                                height: context.screenHeight / 45,
                                width: context.screenWidth / 45,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                verticalSpace(7),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: context.screenWidth / 2.0,
                  ),

                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    "${favorite.description}",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
