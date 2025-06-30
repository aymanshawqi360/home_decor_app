// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestModel _$SignUpRequestModelFromJson(Map<String, dynamic> json) =>
    SignUpRequestModel(
      confirmPassword: json['confirm_password'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      email: json['email'] as String?,
      fullName: json['full_name'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      password: json['password'] as String?,
      userName: json['username'] as String?,
    );

Map<String, dynamic> _$SignUpRequestModelToJson(SignUpRequestModel instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'email': instance.email,
      'username': instance.userName,
      'mobile_number': instance.mobileNumber,
      'date_of_birth': instance.dateOfBirth,
      'password': instance.password,
      'confirm_password': instance.confirmPassword,
    };
