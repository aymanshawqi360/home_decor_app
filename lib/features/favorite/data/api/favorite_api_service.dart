import 'package:dio/dio.dart';
import 'package:home_decor_app/core/networks/api_constants.dart';
import 'package:home_decor_app/features/favorite/data/api/favorite_api_constants.dart';
import 'package:home_decor_app/features/favorite/data/model/favorite_api_request_model.dart';
import 'package:home_decor_app/features/favorite/data/model/favorite_api_response_model.dart';
import 'package:home_decor_app/features/favorite/data/model/list_favorite_api_response_model.dart';
import 'package:home_decor_app/features/favorite/domain/entity/list_favorite_api_response_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'favorite_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class FavoriteApiService {
  factory FavoriteApiService(Dio dio, {String? baseUrl}) = _FavoriteApiService;

  @POST('${FavoriteApiConstants.addFavorite}{id}/')
  Future<FavoriteApiResponseModel> addingFavorite(@Path('id') String id);
  @GET(FavoriteApiConstants.getFavorite)
  Future<List<ListFavoriteApiResponseModel>> getListFavorite();
}
