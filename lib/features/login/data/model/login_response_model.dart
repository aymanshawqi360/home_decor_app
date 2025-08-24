import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  User? user;
  @JsonKey(name: "access")
  String? accessToken;
  @JsonKey(name: "refresh")
  String? refreshToken;
  LoginResponseModel({this.accessToken, this.refreshToken, this.user});
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "username")
  String? userName;
  String? email;
  User({this.email, this.userName});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
