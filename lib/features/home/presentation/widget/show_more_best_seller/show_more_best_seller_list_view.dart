import 'package:flutter/material.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/widgets/app_list_view.dart';
import 'package:home_decor_app/features/home/domain/entities/best_seller_entity.dart';
import 'package:home_decor_app/features/home/presentation/widget/show_more_best_seller/view_best_seller_item.dart';

class ShowMoreBestSellerListView extends StatelessWidget {
  final List<BestSellerEntity> showMoreList;
  const ShowMoreBestSellerListView({super.key, required this.showMoreList});

  @override
  Widget build(BuildContext context) {
    return AppListView(
      shrinkWrap: true,
      itemCount: showMoreList.length,

      itemBuilder: (context, index) {
        return SizedBox(
          height: context.screenHeight / 6,
          child: ViewBestSellerItem(bestSellerEntity: showMoreList[index]),
        );
      },
    );
  }
}
