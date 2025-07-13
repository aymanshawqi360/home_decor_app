import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/features/home/domain/entities/categories_entity.dart';
import 'package:home_decor_app/features/home/presentation/cubit/categories/categories_cubit.dart';
import 'package:home_decor_app/features/home/presentation/widget/categories_list/home_catedories.dart';

class CategoriesListView extends StatefulWidget {
  final List<CategoriesEntity> categoriesEntity;
  const CategoriesListView({super.key, required this.categoriesEntity});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      constraints: BoxConstraints(maxHeight: context.screenHeight / 9.0),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,

        itemCount: widget.categoriesEntity.length,

        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.read<CategoriesCubit>().categorySelection(index);
            },
            child: HomeCatedories(
              startIndex: index,
              categoryEntity: widget.categoriesEntity[index],
            ),
          );
        },
      ),
    );
  }
}
