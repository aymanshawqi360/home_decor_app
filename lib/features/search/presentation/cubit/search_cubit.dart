import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor_app/core/networks/api_error_model.dart';
import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/search/domain/entity/search_api_settings_response_model_entity.dart';
import 'package:home_decor_app/features/search/domain/entity/search_request_body_model_entity.dart';
import 'package:home_decor_app/features/search/domain/entity/search_response_model_entity.dart';
import 'package:home_decor_app/features/search/domain/use_cases/search_use_cases.dart';
import 'package:home_decor_app/features/search/presentation/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCases _searchUseCases;
  SearchCubit(this._searchUseCases) : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);
  int? colotId;
  double? minPrice;
  int? subCategoryId;
  int? indexProduct;
  double maxPrice = 233.8;

  List<SearchResponseModelEntity> products = [];
  getFilterResult({
    String query = '',
    int? color,
    double? max,
    double? min,
    int? sub,
  }) async {
    emit(SearchLoagin(productLoading: products));

    final response = await _searchUseCases.getSearch(
      SearchRequestBodyModelEntity(
        colorId: color ?? null,
        maxPrice: max ?? null,
        minPrice: min ?? null,
        searchQuery: query,
        subCategoryId: sub ?? null,
      ),
    );

    if (response is Success<List<SearchResponseModelEntity>>) {
      products.clear();
      products = response.data ?? [];

      emit(SearchSuccess(products: response.data ?? []));
    } else if (response is Failure<List<SearchResponseModelEntity>>) {
      emit(
        SearchFailure(
          errorMessage: ApiErrorModel(
            errorMessage:
                response.errorMessage?.errorMessage ?? "Unknown error occurred",
          ),
        ),
      );
    }
  }

  List<SearchColorsEntity> resultSearchColorsEntity = [];
  List<SearchSubCategoriesEntity> resultlistSearchSubCategoriesEntity = [];
  SearchPriceRangeEntity resultSearchPriceRangeEntit = SearchPriceRangeEntity();

  getApiSettings() async {
    emit(SearchApiSettingsLoading());
    final response = await _searchUseCases.getApiSettings();

    if (response is Success<SearchApiSettingsResponseModelEntity>) {
      resultSearchColorsEntity = response.data?.colors ?? [];
      resultlistSearchSubCategoriesEntity = response.data?.subCategories ?? [];
      resultSearchPriceRangeEntit = response.data!.priceRange!;
      //  SearchPriceRangeEntity(
      //   maxPrice: response.data?.priceRange?.maxPrice,
      //   minPrice: response.data?.priceRange?.minPrice,
      // );

      emit(
        SearchApiSettingsSuccess(
          // resultSearchColorsEntity: response.data?.colors ?? [],
          // resultSearchPriceRangeEntity:
          //     response.data?.priceRange ??

          // resultlistSearchSubCategoriesEntity:
          //     response.data?.subCategories ?? [],
        ),
      );
    } else if (response is Failure<SearchApiSettingsResponseModelEntity>) {
      emit(
        SearchApiSettingsFailure(
          errorMessage: ApiErrorModel(
            errorMessage:
                response.errorMessage?.errorMessage ?? "Unknown error occurred",
          ),
        ),
      );
    }
  }

  setColor({int? id}) {
    colotId = id;
    emit(SearchColorSelected(colorId: id));
    return colotId;
  }

  // setMaxPrice({double? max}) {
  //   maxPrice = max;
  //   emit(SearchMaxPriceSelected(maxPrice: maxPrice));
  //   return maxPrice;
  // }

  setMinPrice() {
    minPrice = resultSearchPriceRangeEntit.minPrice;
    emit(SearchMinPriceSelected(minPrice: minPrice));
    return minPrice;
  }

  // setSearchQuery({double? query}) {
  //   emit(SearchSearchQuerySelected(searchQuery: query));
  //   return query;
  // }

  setSubCategoryId({int? query}) {
    subCategoryId = query;
    emit(SearchSubCategoryIdSelected(subCategoryId: subCategoryId));
    return subCategoryId;
  }
}
