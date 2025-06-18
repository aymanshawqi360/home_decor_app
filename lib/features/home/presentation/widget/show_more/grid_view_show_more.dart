import 'package:flutter/material.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/core/widgets/app_grid_view.dart';
import 'package:home_decor_app/features/home/domain/entities/categories_entity.dart';
import 'package:home_decor_app/features/home/presentation/widget/show_more/show_more.dart';

class GridViewShowMore extends StatelessWidget {
  final List<CategoriesEntity> categorieslist;
  const GridViewShowMore({super.key, required this.categorieslist});

  @override
  Widget build(BuildContext context) {
    return AppGridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: categorieslist.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ShowMore(category: categorieslist[index]),
            verticalSpace(5),
            Text(
              categorieslist[index].name.toString(),
              style: TextStyles.font10DarkGrayishBrownMedium,
            ),
          ],
        );
      },
    );
  }
}
