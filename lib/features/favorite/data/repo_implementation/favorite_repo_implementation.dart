import 'package:home_decor_app/core/networks/api_error_hundler.dart';
import 'package:home_decor_app/core/networks/api_result.dart';
import 'package:home_decor_app/features/favorite/data/api/favorite_api_service.dart';
import 'package:home_decor_app/features/favorite/data/mappers/favorite_api_request_mapper.dart';
import 'package:home_decor_app/features/favorite/domain/entity/favorite_api_response_entity.dart';
import 'package:home_decor_app/features/favorite/domain/entity/list_favorite_api_response_entity.dart';
import 'package:home_decor_app/features/favorite/domain/repo/favorite_repo.dart';

class FavoriteRepoImplementation extends FavoriteRepo {
  final FavoriteApiService favoriteApiService;

  FavoriteRepoImplementation({required this.favoriteApiService});
  @override
  Future<ApiResulte<FavoriteApiResponseEntity>> addingFavorite(
    String path,
  ) async {
    try {
      final response = await favoriteApiService.addingFavorite(path);

      return ApiResulte.success(
        FavoriteApiRequestMapper.getMessageFavorite(response),
      );
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHundle(e));
    }
  }

  @override
  Future<ApiResulte<List<ListFavoriteApiResponseEntity>>>
  getListFavorite() async {
    try {
      final response = await favoriteApiService.getListFavorite();
      List<ListFavoriteApiResponseEntity> getListFavorite =
          response
              .map((vlaue) => FavoriteApiRequestMapper.getListFavorite(vlaue))
              .toList();
      return ApiResulte.success(getListFavorite);
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHundle(e));
    }
  }
}
