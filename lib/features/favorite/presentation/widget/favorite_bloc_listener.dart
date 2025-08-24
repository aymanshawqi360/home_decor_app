import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_decor_app/core/helper/app_assets.dart';
import 'package:home_decor_app/core/helper/extensions.dart';
import 'package:home_decor_app/core/helper/spacing.dart';
import 'package:home_decor_app/core/theme/styles.dart';
import 'package:home_decor_app/core/widgets/app_list_view.dart';
import 'package:home_decor_app/features/favorite/presentation/cubit/cubit/favorite_cubit.dart';
import 'package:home_decor_app/features/favorite/presentation/cubit/cubit/favorite_state.dart';
import 'package:home_decor_app/features/favorite/presentation/widget/favorite_shimmer_loading.dart';
import 'package:home_decor_app/features/favorite/presentation/widget/list_view_favorite.dart';

class FavoriteBlocListener extends StatefulWidget {
  const FavoriteBlocListener({super.key});

  @override
  State<FavoriteBlocListener> createState() => _FavoriteBlocListenerState();
}

class _FavoriteBlocListenerState extends State<FavoriteBlocListener> {
  @override
  void initState() {
    context.read<FavoriteCubit>().getListFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      buildWhen:
          (previous, current) =>
              current is GetFavoriteLoading ||
              current is GetFavoriteSuccess ||
              current is GetFavoriteFailure,
      builder: (context, state) {
        switch (state) {
          case GetFavoriteLoading():
            return _buildLoadingState();
          case GetFavoriteSuccess():
            return _buildSuccessState(state);
          case GetFavoriteFailure():
            return _buildFailureState();

          default:
            return Center(child: Text("Error Favorite"));
        }
      },
    );
  }

  Widget _buildFailureState() {
    return Center(child: SvgPicture.asset(AppAssets.imageAndSvg.favoriteEmpty));
  }

  Widget _buildLoadingState() {
    // return Center(child: CircularProgressIndicator());
    return AppListView(
      itemCount: context.read<FavoriteCubit>().listFavorite.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsetsGeometry.only(bottom: context.screenHeight / 20),
          child: FavoriteShimmerLoading(),
        );
      },
    );
  }

  _buildSuccessState(GetFavoriteSuccess state) {
    return state.listFavorite.isEmpty
        ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.imageAndSvg.favoriteEmpty),
              verticalSpace(context.screenHeight / 35),
              Text(
                textAlign: TextAlign.center,
                "Your Wishlist is\n Empty.",
                style: TextStyles.font20DarkGrayMedium,
              ),
            ],
          ),
        )
        : ListViewFavorite(listFavorite: state.listFavorite);
  }
}
