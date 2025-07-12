import 'package:equatable/equatable.dart';

import 'package:home_decor_app/core/networks/api_error_model.dart';
import 'package:home_decor_app/features/search/domain/entity/search_response_model_entity.dart';

sealed class SearchState extends Equatable {}

class SearchInitial extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoagin extends SearchState {
  final List<SearchResponseModelEntity> productLoading;

  SearchLoagin({required this.productLoading});

  @override
  List<Object?> get props => [productLoading];
}

class SearchSuccess extends SearchState {
  final List<SearchResponseModelEntity> products;

  SearchSuccess({required this.products});
  @override
  List<Object?> get props => [products];
}

class SearchFailure extends SearchState {
  final ApiErrorModel errorMessage;

  SearchFailure({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class SearchApiSettingsLoading extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchApiSettingsSuccess extends SearchState {
  // final List<SearchColorsEntity> resultSearchColorsEntity;
  // final List<SearchSubCategoriesEntity> resultlistSearchSubCategoriesEntity;
  // final SearchPriceRangeEntity resultSearchPriceRangeEntity;
  // SearchApiSettingsSuccess({
  //   required this.resultSearchColorsEntity,
  //   required this.resultSearchPriceRangeEntity,
  //   required this.resultlistSearchSubCategoriesEntity,
  // });
  @override
  List<Object?> get props => [
    // resultSearchColorsEntity,
    // resultSearchPriceRangeEntity,
    // resultlistSearchSubCategoriesEntity,
  ];
}

class SearchApiSettingsFailure extends SearchState {
  final ApiErrorModel errorMessage;

  SearchApiSettingsFailure({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class SearchColorSelected extends SearchState {
  final int? colorId;

  SearchColorSelected({required this.colorId});

  @override
  List<Object?> get props => [colorId];
}

class SearchMaxPriceSelected extends SearchState {
  final double? maxPrice;
  SearchMaxPriceSelected({required this.maxPrice});

  @override
  List<Object?> get props => [maxPrice];
}

class SearchMinPriceSelected extends SearchState {
  final double? minPrice;
  SearchMinPriceSelected({required this.minPrice});

  @override
  List<Object?> get props => [minPrice];
}

class SearchSearchQuerySelected extends SearchState {
  final double? searchQuery;
  SearchSearchQuerySelected({required this.searchQuery});

  @override
  List<Object?> get props => [searchQuery];
}

class SearchSubCategoryIdSelected extends SearchState {
  final int? subCategoryId;
  SearchSubCategoryIdSelected({required this.subCategoryId});

  @override
  List<Object?> get props => [subCategoryId];
}
