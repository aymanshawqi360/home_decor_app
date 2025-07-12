// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponseModel _$SearchResponseModelFromJson(Map<String, dynamic> json) =>
    SearchResponseModel(
      count: (json['count'] as num?)?.toInt(),
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$SearchResponseModelToJson(
  SearchResponseModel instance,
) => <String, dynamic>{'items': instance.items, 'count': instance.count};

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
  color: json['color'] as String?,
  description: json['description'] as String?,
  id: (json['id'] as num?)?.toInt(),
  image: json['image'] as String?,
  isSale: json['is_sale'] as bool?,
  name: json['name'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  rate: (json['rate'] as num?)?.toDouble(),
  salePrice: (json['sale_price'] as num?)?.toDouble(),
  subCategoryId: json['sub_category_id'] as String?,
);

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
  'id': instance.id,
  'sub_category_id': instance.subCategoryId,
  'color': instance.color,
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'is_sale': instance.isSale,
  'sale_price': instance.salePrice,
  'image': instance.image,
  'rate': instance.rate,
};
