// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:home_decor_app/core/networks/api_error_model.dart';
import 'package:home_decor_app/features/home/domain/entities/categories_entity.dart';

sealed class ShowMoreState {}

class ShowMoreInitial extends ShowMoreState {}

class ShowMoreLoading extends ShowMoreState {}

class ShowMoreSuccess extends ShowMoreState {
  final List<CategoriesEntity> categoriesEntity;
  ShowMoreSuccess({required this.categoriesEntity});
}

class ShowMoreFailure extends ShowMoreState {
  ApiErrorModel? errorMessage;
  ShowMoreFailure({required this.errorMessage});
}
