import 'package:flutter/material.dart';
import 'package:home_decor_app/features/favorite/presentation/widget/appbar_favorite.dart';
import 'package:home_decor_app/features/favorite/presentation/widget/favorite_bloc_listener.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarFavorite(), body: FavoriteBlocListener());
  }
}
