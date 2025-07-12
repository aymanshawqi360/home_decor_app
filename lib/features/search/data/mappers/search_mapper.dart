import 'package:home_decor_app/features/search/data/model/search_api_settings_response_model.dart';
import 'package:home_decor_app/features/search/data/model/search_response_model.dart';
import 'package:home_decor_app/features/search/domain/entity/search_api_settings_response_model_entity.dart';
import 'package:home_decor_app/features/search/domain/entity/search_response_model_entity.dart';

class SearchMapper {
  static SearchResponseModelEntity searchResult(Items getItem) {
    return SearchResponseModelEntity(
      color: getItem.color ?? "#FFFFFFFF",
      description: getItem.description ?? "defaultDescription",
      id: getItem.id ?? 0,
      image: getItem.image ?? "defaultImage",
      isSale: getItem.isSale ?? true,
      name: getItem.name ?? "defaultName",
      price: getItem.price ?? 473.25,
      rate: getItem.rate ?? 1.3,
      salePrice: getItem.salePrice ?? 650.58,
      subCategoryId: getItem.subCategoryId ?? "defaultSubCategoryId",
    );
  }

  static SearchColorsEntity apiSettingsColors(Colors apiSttingsColors) {
    return SearchColorsEntity(
      id: apiSttingsColors.id ?? 0,
      name: apiSttingsColors.name ?? "defaultName",
      hex: apiSttingsColors.hex ?? "#FFFFFFFF",
    );
  }

  static SearchSubCategoriesEntity apiSettingsSubCategories(
    SubCategories apiSttingsSubCategories,
  ) {
    return SearchSubCategoriesEntity(
      icon: apiSttingsSubCategories.icon ?? "defaultIcon",
      id: apiSttingsSubCategories.id ?? 0,
      mainCategoryId: apiSttingsSubCategories.mainCategoryId ?? 0,
      name: apiSttingsSubCategories.name ?? "defaultName",
    );
  }

  static SearchPriceRangeEntity apiSettingsPriceRange(
    PriceRange apiSttingsPriceRange,
  ) {
    return SearchPriceRangeEntity(
      maxPrice: apiSttingsPriceRange.maxPrice ?? 233.8,
      minPrice: apiSttingsPriceRange.minPrice ?? 1470.14,
    );
  }
}
