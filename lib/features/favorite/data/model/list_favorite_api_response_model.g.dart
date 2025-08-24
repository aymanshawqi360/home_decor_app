// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_favorite_api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListFavoriteApiResponseModel _$ListFavoriteApiResponseModelFromJson(
  Map<String, dynamic> json,
) => ListFavoriteApiResponseModel(
  id: (json['id'] as num?)?.toInt(),
  subCategoryId: json['sub_category_id'] as String?,
  color: json['color'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  isSale: json['is_sale'] as bool?,
  salePrice: json['salePrice'],
  image: json['image'] as String?,
  rate: (json['rate'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ListFavoriteApiResponseModelToJson(
  ListFavoriteApiResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'sub_category_id': instance.subCategoryId,
  'color': instance.color,
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'is_sale': instance.isSale,
  'salePrice': instance.salePrice,
  'image': instance.image,
  'rate': instance.rate,
};
