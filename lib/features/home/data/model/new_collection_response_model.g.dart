// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_collection_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewCollectionResponseModel _$NewCollectionResponseModelFromJson(
  Map<String, dynamic> json,
) => NewCollectionResponseModel(
  newCollectionList:
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

Map<String, dynamic> _$NewCollectionResponseModelToJson(
  NewCollectionResponseModel instance,
) => <String, dynamic>{
  'data': instance.newCollectionList,
  'links': instance.links,
  'meta': instance.meta,
};
