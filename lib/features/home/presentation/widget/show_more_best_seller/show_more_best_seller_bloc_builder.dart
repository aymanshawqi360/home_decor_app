import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/features/home/presentation/cubit/show_more_best_seller/show_more_best_seller_cubit.dart';
import 'package:home_decor_app/features/home/presentation/cubit/show_more_best_seller/show_more_best_seller_state.dart';
import 'package:home_decor_app/features/home/presentation/widget/show_more_best_seller/show_more_best_seller_list_view.dart';
import 'package:home_decor_app/features/home/presentation/widget/show_more_best_seller/show_more_best_seller_shimmer_loading.dart';

class ShowMoreBestSellerBlocBuilder extends StatelessWidget {
  const ShowMoreBestSellerBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Best Seller", style: TextStyles.font15LigthBrownSemiBold),
      ),
      body: BlocBuilder<ShowMoreBestSellerCubit, ShowMoreBestSellerState>(
        buildWhen:
            (previous, current) =>
                current is ShowMoreBestSellerFailure ||
                current is ShowMoreBestSellerLoading ||
                current is ShowMoreBestSellerSuccess,
        builder: (context, state) {
          switch (state) {
            case ShowMoreBestSellerFailure _:
              return _buildFailureState(state);
            case ShowMoreBestSellerLoading _:
              return _buildLoadingState();
            case ShowMoreBestSellerSuccess _:
              return _buildSuccessState(state);

            default:
              return Center(
                child: Text(
                  "defaultError",
                  style: TextStyle(color: Colors.red),
                ),
              );
          }
        },
      ),
    );
  }

  Widget _buildFailureState(ShowMoreBestSellerFailure state) {
    return Text("${state.errorMessage.errorMessage}");
  }

  Widget _buildLoadingState() {
    return ShowMoreBestSellerShimmerLoading();
  }

  Widget _buildSuccessState(ShowMoreBestSellerSuccess state) {
    return ShowMoreBestSellerListView(showMoreList: state.bestSellerEntity);
  }
}
