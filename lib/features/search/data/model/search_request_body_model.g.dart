// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRequestBodyModel _$SearchRequestBodyModelFromJson(
  Map<String, dynamic> json,
) => SearchRequestBodyModel(
  colorId: (json['color_id'] as num?)?.toInt(),
  maxPrice: (json['max_price'] as num?)?.toDouble(),
  minPrice: (json['min_price'] as num?)?.toDouble(),
  searchQuery: json['search_query'] as String?,
  subCategoryId: (json['sub_category_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$SearchRequestBodyModelToJson(
  SearchRequestBodyModel instance,
) => <String, dynamic>{
  'min_price': instance.minPrice,
  'max_price': instance.maxPrice,
  'color_id': instance.colorId,
  'sub_category_id': instance.subCategoryId,
  'search_query': instance.searchQuery,
};
