// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_seller_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestSellerResponseModel _$BestSellerResponseModelFromJson(
  Map<String, dynamic> json,
) => BestSellerResponseModel(
  bestSellerList:
      (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
  links:
      json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
  meta:
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BestSellerResponseModelToJson(
  BestSellerResponseModel instance,
) => <String, dynamic>{
  'data': instance.bestSellerList,
  'links': instance.links,
  'meta': instance.meta,
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
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

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
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

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
  first: json['first'] as String?,
  last: json['last'] as String?,
  next: json['next'] as String?,
  prev: json['prev'] as String?,
);

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
  'first': instance.first,
  'last': instance.last,
  'prev': instance.prev,
  'next': instance.next,
};

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  currentPage: (json['current_page'] as num?)?.toInt(),
  from: (json['from'] as num?)?.toInt(),
  lastPage: (json['last_page'] as num?)?.toInt(),
  links:
      (json['links'] as List<dynamic>?)
          ?.map((e) => MetaLinks.fromJson(e as Map<String, dynamic>))
          .toList(),
  path: json['path'] as String?,
  perPage: (json['per_page'] as num?)?.toInt(),
  to: (json['to'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
  'current_page': instance.currentPage,
  'from': instance.from,
  'last_page': instance.lastPage,
  'links': instance.links,
  'path': instance.path,
  'per_page': instance.perPage,
  'to': instance.to,
  'total': instance.total,
};

MetaLinks _$MetaLinksFromJson(Map<String, dynamic> json) => MetaLinks(
  json['url'] as String?,
  json['active'] as bool?,
  json['label'] as String?,
);

Map<String, dynamic> _$MetaLinksToJson(MetaLinks instance) => <String, dynamic>{
  'url': instance.url,
  'label': instance.label,
  'active': instance.active,
};
