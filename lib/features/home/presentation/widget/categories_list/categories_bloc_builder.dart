import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor_app/features/home/presentation/cubit/categories/categories_cubit.dart';
import 'package:home_decor_app/features/home/presentation/cubit/categories/categories_state.dart';
import 'package:home_decor_app/features/home/presentation/widget/categories_list/categories_list_view.dart';
import 'package:home_decor_app/features/home/presentation/widget/categories_list/categories_shimmer_loading.dart';

class CategoriesBlocBuilder extends StatefulWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  State<CategoriesBlocBuilder> createState() => _CategoriesBlocBuilderState();
}

class _CategoriesBlocBuilderState extends State<CategoriesBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      buildWhen:
          (previous, current) =>
              current is CategoriesFailure ||
              current is CategoriesLoading ||
              current is CategoriesSuccess,
      builder: (context, state) {
        switch (state) {
          case CategoriesFailure _:
            return _buildFailureSate();
          case CategoriesLoading _:
            return _buildLoadingSate();
          case CategoriesSuccess _:
            return _buildSuccessSate(state);
          default:
            return Center(
              child: Text("default State", style: TextStyle(color: Colors.red)),
            );
        }
      },
    );
  }

  Widget _buildFailureSate() {
    return AspectRatio(
      aspectRatio: 15 / 3.5,
      child: Text("data", style: TextStyle(color: Colors.red)),
    );
  }

  Widget _buildLoadingSate() {
    return CategoriesShimmerLoading();
  }

  Widget _buildSuccessSate(CategoriesSuccess success) {
    return CategoriesListView(categoriesEntity: success.categoriesEntity);
  }
}
