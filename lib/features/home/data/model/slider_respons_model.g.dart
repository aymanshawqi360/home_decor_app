// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_respons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderResponsModel _$SliderResponsModelFromJson(Map<String, dynamic> json) =>
    SliderResponsModel(
      sliderList:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$SliderResponsModelToJson(SliderResponsModel instance) =>
    <String, dynamic>{'data': instance.sliderList};

Data _$DataFromJson(Map<String, dynamic> json) =>
    Data(id: (json['id'] as num?)?.toInt(), image: json['image'] as String?);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'id': instance.id,
  'image': instance.image,
};

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  currentPage: (json['current_page'] as num?)?.toInt(),
  from: (json['from'] as num?)?.toInt(),
  lastPage: (json['last_page'] as num?)?.toInt(),
  links:
      (json['links'] as List<dynamic>?)
          ?.map((e) => Links.fromJson(e as Map<String, dynamic>))
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
