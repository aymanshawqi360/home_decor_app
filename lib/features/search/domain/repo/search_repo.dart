import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/search/domain/entity/search_api_settings_response_model_entity.dart';
import 'package:home_decor_app/features/search/domain/entity/search_request_body_model_entity.dart';
import 'package:home_decor_app/features/search/domain/entity/search_response_model_entity.dart';

abstract class SearchRepo {
  Future<ApiResulte<List<SearchResponseModelEntity>>> getSearch(
    SearchRequestBodyModelEntity searchRequestBodyModelEntity,
  );
  Future<ApiResulte<SearchApiSettingsResponseModelEntity>> getApiSettings();
}
