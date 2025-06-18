import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor_app/features/home/presentation/cubit/new_collection/new_collection_cubit.dart';
import 'package:home_decor_app/features/home/presentation/cubit/new_collection/new_collection_state.dart';
import 'package:home_decor_app/features/home/presentation/widget/new_collection/new_collection_grid_view_list.dart';
import 'package:home_decor_app/features/home/presentation/widget/new_collection/new_collection_shimmer_loading.dart';

class NewCollectionBlocBuilder extends StatelessWidget {
  const NewCollectionBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewCollectionCubit, NewCollectionState>(
      buildWhen:
          (previous, current) =>
              current is NewCollectionFailure ||
              current is NewCollectionLoading ||
              current is NewCollectionSuccess,
      builder: (context, state) {
        switch (state) {
          case NewCollectionFailure _:
            return _buildFailureState(state);
          case NewCollectionLoading _:
            return _buildLoadingState();
          case NewCollectionSuccess _:
            return _buildSuccessState(state);

          default:
            return Text("DefaultError");
        }
      },
    );
  }

  Widget _buildLoadingState() {
    return NewCollectionShimmerLoading();
  }

  Widget _buildFailureState(NewCollectionFailure state) {
    return Center(child: Text("${state.errorMessage.message}"));
  }

  Widget _buildSuccessState(NewCollectionSuccess state) {
    return NewCollectionGridViewList(
      newCollectionList: state.newCollectionList,
    );
  }
}
