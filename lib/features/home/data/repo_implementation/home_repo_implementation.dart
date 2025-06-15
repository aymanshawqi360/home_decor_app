import 'package:home_decor_app/core/networks/api_error_hundler.dart';
import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/home/data/apis/home_api_service.dart';
import 'package:home_decor_app/features/home/data/mappers/slider_mappers.dart';
import 'package:home_decor_app/features/home/data/model/slider_respons_model.dart';
import 'package:home_decor_app/features/home/domain/entities/slider_entity.dart';
import 'package:home_decor_app/features/home/domain/repo/home_repo.dart';

class HomeRepoImplementation extends HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepoImplementation(this._homeApiService);

  @override
  Future<ApiResulte<List<SliderEntity>>> getSlider() async {
    try {
      SliderResponsModel response = await _homeApiService.getSlider();
      List<SliderEntity>? sliderList =
          response.sliderList
              ?.map((value) => SliderMappers.toSliderEntity(value))
              .toList();
      return ApiResulte.success(sliderList ?? []);
    } catch (e) {
      return ApiResulte.failure(ApiErrorHandler.apiHundle(e));
    }
  }
}
