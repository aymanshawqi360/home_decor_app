import 'package:flutter/material.dart';
import 'package:home_decor_app/core/widgets/app_grid_view.dart';
import 'package:home_decor_app/features/home/domain/entities/new_collection_entity.dart';
import 'package:home_decor_app/features/home/presentation/widget/new_collection/new_collection_grid_item.dart';

class NewCollectionGridViewList extends StatelessWidget {
  final List<NewCollectionEntity> newCollectionList;
  const NewCollectionGridViewList({super.key, required this.newCollectionList});

  @override
  Widget build(BuildContext context) {
    return AppGridView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      scrollPhysics: NeverScrollableScrollPhysics(),
      itemCount: newCollectionList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        // mainAxisExtent: 250,
        mainAxisExtent: 220,
      ),
      itemBuilder: (context, index) {
        return NewCollectionGridItem(
          newCollectionEntity: newCollectionList[index],
        );
      },
    );
  }
}
