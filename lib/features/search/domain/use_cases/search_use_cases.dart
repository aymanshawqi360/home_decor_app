import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/search/domain/entity/search_api_settings_response_model_entity.dart';
import 'package:home_decor_app/features/search/domain/entity/search_request_body_model_entity.dart';
import 'package:home_decor_app/features/search/domain/entity/search_response_model_entity.dart';
import 'package:home_decor_app/features/search/domain/repo/search_repo.dart';

class SearchUseCases {
  final SearchRepo _searchRepo;
  SearchUseCases(this._searchRepo);
  Future<ApiResulte<List<SearchResponseModelEntity>>> getSearch(
    SearchRequestBodyModelEntity searchRequestBodyModelEntity,
  ) async {
    return await _searchRepo.getSearch(searchRequestBodyModelEntity);
  }

  Future<ApiResulte<SearchApiSettingsResponseModelEntity>>
  getApiSettings() async {
    return await _searchRepo.getApiSettings();
  }
}
