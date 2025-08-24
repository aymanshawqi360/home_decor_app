import 'package:home_decor_app/core/networks/api_result.dart';
import 'package:home_decor_app/features/favorite/domain/entity/favorite_api_response_entity.dart';
import 'package:home_decor_app/features/favorite/domain/entity/list_favorite_api_response_entity.dart';
import 'package:home_decor_app/features/favorite/domain/repo/favorite_repo.dart';

class FavoriteApiUseCases {
  final FavoriteRepo favoriteRepo;
  const FavoriteApiUseCases({required this.favoriteRepo});

  Future<ApiResulte<FavoriteApiResponseEntity>> addingFavorite({
    required String path,
  }) {
    return favoriteRepo.addingFavorite(path);
  }

  Future<ApiResulte<List<ListFavoriteApiResponseEntity>>> getListFavorite() {
    return favoriteRepo.getListFavorite();
  }
}
