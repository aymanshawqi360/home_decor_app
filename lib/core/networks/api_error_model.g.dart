// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) =>
    ApiErrorModel(
      errorMessage: json['errorMessage'] as String?,
      errors: json['errors'] as Map<String, dynamic>?,
      detail: json['detail'] as String?,
      password: json['password'] as List<dynamic>?,
    );

Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
      'detail': instance.detail,
      'password': instance.password,
      'errors': instance.errors,
    };
