import 'package:dio/dio.dart';
import 'package:home_decor_app/core/networks/api_constants.dart';
import 'package:home_decor_app/features/home/data/apis/home_api_constants.dart';
import 'package:home_decor_app/features/home/data/model/categories_response_model.dart';
import 'package:home_decor_app/features/home/data/model/slider_respons_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String? baseUrl}) = _HomeApiService;

  @GET(HomeApiConstants.slider)
  Future<SliderResponsModel> getSlider();

  @GET(HomeApiConstants.categories)
  Future<CategoriesResponseModel> getCategories();
}
