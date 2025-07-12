import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/widgets/app_grid_view.dart';
import 'package:home_decor_app/features/search/domain/entity/search_response_model_entity.dart';
import 'package:home_decor_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:home_decor_app/features/search/presentation/cubit/search_state.dart';
import 'package:home_decor_app/features/search/presentation/widget/product_item.dart';

class SearchGridView extends StatelessWidget {
  final List<SearchResponseModelEntity> products;
  const SearchGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = context.read<SearchCubit>();
        return Expanded(
          child: AppGridView(
            itemCount: products.length,
            // cubit.products.length,
            // (state is SearchSuccess) ? state.products.length : 35,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: context.screenHeight / 30),
            scrollDirection: Axis.vertical,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 2.3,
              crossAxisSpacing: 25,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return
              // Skeletonizer(
              //   enabled: cubit.iss!,
              //   child:
              //   ProductItem(productItem: cubit.products[index]),
              // );
              ProductItem(productItem: cubit.products[index]);
            },
          ),
        );
      },
    );
  }
}
