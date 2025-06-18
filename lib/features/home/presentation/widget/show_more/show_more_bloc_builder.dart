import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/features/home/presentation/cubit/show_more/show_more_cubit.dart';
import 'package:home_decor_app/features/home/presentation/cubit/show_more/show_more_state.dart';
import 'package:home_decor_app/features/home/presentation/widget/show_more/grid_view_show_more.dart';
import 'package:home_decor_app/features/home/presentation/widget/show_more/show_more_shimmer_loading.dart';

class ShowMoreBlocBuilder extends StatelessWidget {
  const ShowMoreBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Categories", style: TextStyles.font15LigthBrownSemiBold),
      ),
      body: BlocBuilder<ShowMoreCubit, ShowMoreState>(
        buildWhen:
            (previous, current) =>
                current is ShowMoreFailure ||
                current is ShowMoreLoading ||
                current is ShowMoreSuccess,
        builder: (context, state) {
          switch (state) {
            case ShowMoreFailure _:
              return _buildFailureSate(state, context);
            case ShowMoreLoading _:
              return _buildLoadingSate();
            case ShowMoreSuccess _:
              return _buildSuccessSate(state);
            default:
              return Center(
                child: Text(
                  "default State",
                  style: TextStyle(color: Colors.red),
                ),
              );
          }
        },
      ),
    );
  }

  Widget _buildFailureSate(ShowMoreFailure state, BuildContext context) {
    return Center(child: Text("Error", style: TextStyle(color: Colors.red)));
  }

  Widget _buildLoadingSate() {
    return ShowMoreShimmerLoading();
  }

  Widget _buildSuccessSate(ShowMoreSuccess state) {
    return GridViewShowMore(categorieslist: state.categoriesEntity);
  }
}
