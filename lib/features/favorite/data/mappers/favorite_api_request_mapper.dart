import 'package:home_decor_app/features/favorite/data/model/favorite_api_response_model.dart';
import 'package:home_decor_app/features/favorite/data/model/list_favorite_api_response_model.dart';
import 'package:home_decor_app/features/favorite/domain/entity/favorite_api_response_entity.dart';
import 'package:home_decor_app/features/favorite/domain/entity/list_favorite_api_response_entity.dart';

class FavoriteApiRequestMapper {
  FavoriteApiRequestMapper._();

  static FavoriteApiResponseEntity getMessageFavorite(
    FavoriteApiResponseModel favoriteApiResponseModel,
  ) {
    return FavoriteApiResponseEntity(
      message: favoriteApiResponseModel.message ?? "defaultMessage",
    );
  }

  static ListFavoriteApiResponseEntity getListFavorite(
    ListFavoriteApiResponseModel getFavorite,
  ) {
    return ListFavoriteApiResponseEntity(
      color: getFavorite.color ?? "defaultColor",
      description: getFavorite.description ?? "defaultDescription",
      id: getFavorite.id ?? 0,
      image: getFavorite.image ?? "defaultImage",
      isSale: getFavorite.isSale ?? false,
      name: getFavorite.name ?? "defaultName",
      price: getFavorite.price ?? 5.2,
      rate: getFavorite.rate ?? 2.0,
      salePrice: getFavorite.salePrice,
      subCategoryId: getFavorite.subCategoryId ?? "defaultSubCategoryId",
    );
  }
}
