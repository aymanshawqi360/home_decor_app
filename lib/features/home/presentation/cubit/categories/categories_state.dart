import 'package:home_decor_app/core/networks/api_error_model.dart';
import 'package:home_decor_app/features/home/domain/entities/categories_entity.dart';

sealed class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {
  CategoriesLoading();
}

class CategoriesSuccess extends CategoriesState {
  final List<CategoriesEntity> categoriesEntity;

  CategoriesSuccess({required this.categoriesEntity});
}

class CategoriesFailure extends CategoriesState {
  final ApiErrorModel errorMessage;
  CategoriesFailure({required this.errorMessage});
}

class CategoriesSelection extends CategoriesState {
  int? selectionNumber;
  CategoriesSelection({required this.selectionNumber});
}
