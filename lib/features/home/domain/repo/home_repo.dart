import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/home/domain/entities/best_seller_entity.dart';
import 'package:home_decor_app/features/home/domain/entities/categories_entity.dart';
import 'package:home_decor_app/features/home/domain/entities/new_collection_entity.dart';
import 'package:home_decor_app/features/home/domain/entities/slider_entity.dart';

abstract class HomeRepo {
  Future<ApiResulte<List<SliderEntity>>> getSlider();
  Future<ApiResulte<List<CategoriesEntity>>> getCategories();
  Future<ApiResulte<List<BestSellerEntity>>> getBestSeller();
  Future<ApiResulte<List<NewCollectionEntity>>> getNewCollectionEntity();
}
