import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_decor_app/core/helper/app_assets.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/widgets/app_list_view.dart';
import 'package:home_decor_app/features/favorite/domain/entity/list_favorite_api_response_entity.dart';
import 'package:home_decor_app/features/favorite/presentation/widget/favorite_item.dart';

class ListViewFavorite extends StatelessWidget {
  final List<ListFavoriteApiResponseEntity> listFavorite;
  const ListViewFavorite({super.key, required this.listFavorite});

  @override
  Widget build(BuildContext context) {
    return AppListView(
      shrinkWrap: true,
      itemCount: listFavorite.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: context.screenHeight / 25),
          child: FavoriteItem(favorite: listFavorite[index]),
        );
      },
    );
  }
}
