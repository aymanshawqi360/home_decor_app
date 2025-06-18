import 'package:home_decor_app/core/networks/api_error_hundler.dart';
import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/home/data/apis/home_api_service.dart';
import 'package:home_decor_app/features/home/data/mappers/best_seller_mappers.dart';
import 'package:home_decor_app/features/home/data/mappers/categories_mappers.dart';
import 'package:home_decor_app/features/home/data/mappers/slider_mappers.dart';
import 'package:home_decor_app/features/home/data/model/best_seller_response_model.dart';
import 'package:home_decor_app/features/home/data/model/categories_response_model.dart';
import 'package:home_decor_app/features/home/data/model/slider_respons_model.dart';
import 'package:home_decor_app/features/home/domain/entities/best_seller_entity.dart';
import 'package:home_decor_app/features/home/domain/entities/categories_entity.dart';
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

  @override
  Future<ApiResulte<List<CategoriesEntity>>> getCategories() async {
    try {
      CategoriesResponseModel response = await _homeApiService.getCategories();
      print("Home Respo================ ${response.toString()}");
      List<CategoriesEntity>? categoriesList =
          response.categoriesList
              ?.map((value) => CategoriesMappers.toCategoriesEntity(value))
              .toList();

      return ApiResulte.success(categoriesList ?? []);
    } catch (failure) {
      return ApiResulte.failure(ApiErrorHandler.apiHundle(failure));
    }
  }

  @override
  Future<ApiResulte<List<BestSellerEntity>>> getBestSeller() async {
    try {
      BestSellerResponseModel response = await _homeApiService.getBestSeller();

      List<BestSellerEntity>? bestSellerList =
          response.bestSellerList
              ?.map((value) => BestSellerMappers.toBestSellerEntity(value))
              .toList();
      return ApiResulte.success(bestSellerList ?? []);
    } catch (faiture) {
      return ApiResulte.failure(ApiErrorHandler.apiHundle(faiture));
    }
  }
}
