import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor_app/core/widgets/app_grid_view.dart';
import 'package:home_decor_app/features/search/domain/entity/search_response_model_entity.dart';
import 'package:home_decor_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:home_decor_app/features/search/presentation/cubit/search_state.dart';
import 'package:home_decor_app/features/search/presentation/widget/product_empty.dart';
import 'package:home_decor_app/features/search/presentation/widget/search_grid_view.dart';
import 'package:home_decor_app/features/search/presentation/widget/search_of_loading_shimmer_product.dart';

class SearchBlocBuilder extends StatefulWidget {
  const SearchBlocBuilder({super.key});

  @override
  State<SearchBlocBuilder> createState() => _SearchBlocBuilderState();
}

class _SearchBlocBuilderState extends State<SearchBlocBuilder> {
  List<SearchResponseModelEntity> list = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen:
          (previous, current) =>
              current is SearchLoagin ||
              current is SearchSuccess ||
              current is SearchFailure,
      builder: (context, state) {
        switch (state) {
          case SearchLoagin():
            return _buildLoadingState(state, context);
          case SearchSuccess():
            return _buildSuccessState(state);
          case SearchFailure():
            return _buildFailuerState(state);
          default:
            return SizedBox.shrink();
        }
      },
    );
  }

  _buildSuccessState(SearchSuccess state) {
    list = state.products;
    return state.products.isNotEmpty
        ? SearchGridView(products: state.products)
        : ProductEmpty();
  }

  _buildFailuerState(SearchFailure state) {
    return Center(child: Text("${state.errorMessage.errorMessage}"));
  }

  _buildLoadingState(SearchLoagin state, BuildContext context) {
    return Expanded(
      child: AppGridView(
        itemCount: context.read<SearchCubit>().products.length,

        // state.isLoading.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2.3,
          crossAxisSpacing: 25,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return SearchOfLoadingShimmerProduct();
        },
      ),
    );
  }
}
