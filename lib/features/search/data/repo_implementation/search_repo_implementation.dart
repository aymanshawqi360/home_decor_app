import 'package:home_decor_app/core/networks/api_error_hundler.dart';
import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/search/data/api/search_api_service.dart';
import 'package:home_decor_app/features/search/data/mappers/search_mapper.dart';
import 'package:home_decor_app/features/search/data/model/search_api_settings_response_model.dart';
import 'package:home_decor_app/features/search/data/model/search_request_body_model.dart';
import 'package:home_decor_app/features/search/data/model/search_response_model.dart';
import 'package:home_decor_app/features/search/domain/entity/search_api_settings_response_model_entity.dart';
import 'package:home_decor_app/features/search/domain/entity/search_request_body_model_entity.dart';
import 'package:home_decor_app/features/search/domain/entity/search_response_model_entity.dart';
import 'package:home_decor_app/features/search/domain/repo/search_repo.dart';

class SearchRepoImplementation extends SearchRepo {
  final SearchApiService _searchApiService;
  SearchRepoImplementation(this._searchApiService);

  @override
  Future<ApiResulte<List<SearchResponseModelEntity>>> getSearch(
    SearchRequestBodyModelEntity searchRequestBodyModelEntity,
  ) async {
    try {
      SearchResponseModel response = await _searchApiService.search(
        SearchRequestBodyModel(
          colorId: searchRequestBodyModelEntity.colorId,
          maxPrice: searchRequestBodyModelEntity.maxPrice,
          minPrice: searchRequestBodyModelEntity.minPrice,
          searchQuery: searchRequestBodyModelEntity.searchQuery,
          subCategoryId: searchRequestBodyModelEntity.subCategoryId,
        ),
      );
      List<SearchResponseModelEntity>? searchEntity =
          response.items
              ?.map((value) => SearchMapper.searchResult(value))
              .toList();

      return ApiResulte.success(searchEntity ?? []);
    } catch (failure) {
      return ApiResulte.failure(ApiErrorHandler.apiHundle(failure));
    }
  }

  @override
  Future<ApiResulte<SearchApiSettingsResponseModelEntity>>
  getApiSettings() async {
    try {
      SearchApiSettingsResponseModel response =
          await _searchApiService.apiSettings();
      List<SearchColorsEntity>? responseColorsEntity =
          response.colors
              ?.map((vlaue) => SearchMapper.apiSettingsColors(vlaue))
              .toList();
      List<SearchSubCategoriesEntity>? responseSubPriceRangeEntity =
          response.subCategories
              ?.map((value) => SearchMapper.apiSettingsSubCategories(value))
              .toList();

      SearchPriceRangeEntity responsePriceRangeEntity =
          SearchMapper.apiSettingsPriceRange(
            PriceRange(
              maxPrice: response.priceRange.maxPrice,
              minPrice: response.priceRange.minPrice,
            ),
          );
      return ApiResulte.success(
        SearchApiSettingsResponseModelEntity(
          colors: responseColorsEntity,
          subCategories: responseSubPriceRangeEntity,
          priceRange: responsePriceRangeEntity,
        ),
      );
    } catch (failure) {
      return ApiResulte.failure(ApiErrorHandler.apiHundle(failure));
    }
  }
}
