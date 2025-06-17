import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/home/domain/entities/categories_entity.dart';
import 'package:home_decor_app/features/home/domain/repo/home_repo.dart';

class CategoriesUseCases {
  final HomeRepo _homeRepo;
  CategoriesUseCases(this._homeRepo);

  Future<ApiResulte<List<CategoriesEntity>>> getCategories() async {
    return await _homeRepo.getCategories();
  }

  Future<ApiResulte<List<CategoriesEntity>>> getShowMore() async {
    return await _homeRepo.getCategories();
  }
}
