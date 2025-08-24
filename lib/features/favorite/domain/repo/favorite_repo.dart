import 'package:home_decor_app/core/networks/api_result.dart';
import 'package:home_decor_app/features/favorite/domain/entity/favorite_api_response_entity.dart';
import 'package:home_decor_app/features/favorite/domain/entity/list_favorite_api_response_entity.dart';

abstract class FavoriteRepo {
  Future<ApiResulte<FavoriteApiResponseEntity>> addingFavorite(String path);

  Future<ApiResulte<List<ListFavoriteApiResponseEntity>>> getListFavorite();
}
