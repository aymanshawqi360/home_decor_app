// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_api_settings_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchApiSettingsResponseModel _$SearchApiSettingsResponseModelFromJson(
  Map<String, dynamic> json,
) => SearchApiSettingsResponseModel(
  priceRange: PriceRange.fromJson(json['price_range'] as Map<String, dynamic>),
  bannerId: (json['banner_id'] as num?)?.toInt(),
  subCategories:
      (json['sub_categories'] as List<dynamic>?)
          ?.map((e) => SubCategories.fromJson(e as Map<String, dynamic>))
          .toList(),
  colors:
      (json['colors'] as List<dynamic>?)
          ?.map((e) => Colors.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$SearchApiSettingsResponseModelToJson(
  SearchApiSettingsResponseModel instance,
) => <String, dynamic>{
  'price_range': instance.priceRange,
  'banner_id': instance.bannerId,
  'sub_categories': instance.subCategories,
  'colors': instance.colors,
};

PriceRange _$PriceRangeFromJson(Map<String, dynamic> json) => PriceRange(
  maxPrice: (json['max_price'] as num?)?.toDouble(),
  minPrice: (json['min_price'] as num?)?.toDouble(),
);

Map<String, dynamic> _$PriceRangeToJson(PriceRange instance) =>
    <String, dynamic>{
      'min_price': instance.minPrice,
      'max_price': instance.maxPrice,
    };

SubCategories _$SubCategoriesFromJson(Map<String, dynamic> json) =>
    SubCategories(
      icon: json['icon'] as String?,
      id: (json['id'] as num?)?.toInt(),
      mainCategoryId: (json['main_category_id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SubCategoriesToJson(SubCategories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'main_category_id': instance.mainCategoryId,
    };

Colors _$ColorsFromJson(Map<String, dynamic> json) => Colors(
  hex: json['hex'] as String?,
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
);

Map<String, dynamic> _$ColorsToJson(Colors instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'hex': instance.hex,
};
