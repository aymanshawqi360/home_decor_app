import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor_app/features/home/presentation/cubit/best_seller/best_seller_cubit.dart';
import 'package:home_decor_app/features/home/presentation/cubit/best_seller/best_seller_state.dart';
import 'package:home_decor_app/features/home/presentation/widget/best_seller/best_seller_list_view.dart';
import 'package:home_decor_app/features/home/presentation/widget/best_seller/best_seller_shimmer_loading.dart';

class BestSellerBlocBuilder extends StatefulWidget {
  const BestSellerBlocBuilder({super.key});

  @override
  State<BestSellerBlocBuilder> createState() => _BestSellerBlocBuilderState();
}

class _BestSellerBlocBuilderState extends State<BestSellerBlocBuilder> {
  @override
  void initState() {
    context.read<BestSellerCubit>().getBestSellet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
      buildWhen:
          (previous, current) =>
              current is BestSellerFailure ||
              current is BestSellerLoading ||
              current is BestSellerSuccess,
      builder: (context, state) {
        switch (state) {
          case BestSellerFailure _:
            return _buildFailureState(state);
          case BestSellerLoading _:
            return _buildLoadingState();
          case BestSellerSuccess _:
            return _buildSuccessState(state);

          default:
            return Center(
              child: Text("default State", style: TextStyle(color: Colors.red)),
            );
        }
      },
    );
  }

  Widget _buildFailureState(BestSellerFailure state) {
    return Center(
      child: Text(
        state.errorMessage.message.toString(),
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Widget _buildLoadingState() {
    return BestSellerShimmerLoading();
  }

  Widget _buildSuccessState(BestSellerSuccess state) {
    return BestSellerListView(state.bestSellerEntity);
  }
}
