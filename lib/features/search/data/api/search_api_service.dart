import 'package:dio/dio.dart';
import 'package:home_decor_app/core/networks/api_constants.dart';
import 'package:home_decor_app/features/search/data/api/search_api_constants.dart';
import 'package:home_decor_app/features/search/data/model/search_api_settings_response_model.dart';
import 'package:home_decor_app/features/search/data/model/search_request_body_model.dart';
import 'package:home_decor_app/features/search/data/model/search_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'search_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SearchApiService {
  factory SearchApiService(Dio dio, {String? baseUrl}) = _SearchApiService;

  @POST(SearchApiConstants.search)
  Future<SearchResponseModel> search(
    @Body() SearchRequestBodyModel searchRequestBodyModel,
  );

  @GET(SearchApiConstants.apiSettings)
  Future<SearchApiSettingsResponseModel> apiSettings();
}
