import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/widgets/app_page_view.dart';
import 'package:home_decor_app/features/home/domain/entities/best_seller_entity.dart';
import 'package:home_decor_app/features/home/presentation/widget/best_seller/best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  final List<BestSellerEntity> _bestSeleerList;
  const BestSellerListView(this._bestSeleerList, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight / 5.7,
      child: AppPageView(
        physics: const PageScrollPhysics(),
        controller: PageController(viewportFraction: 1.0),
        itemCount: _bestSeleerList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(end: 4.w, top: 3.h),
            child: BestSellerListViewItem(
              index: index,
              bestSellerEntity: _bestSeleerList[index],
            ),
          );
        },
      ),
    );
  }
}
