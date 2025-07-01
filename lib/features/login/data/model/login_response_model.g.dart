// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      user:
          json['user'] == null
              ? null
              : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
  email: json['email'] as String?,
  userName: json['username'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'username': instance.userName,
  'email': instance.email,
};
