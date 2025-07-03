import 'package:json_annotation/json_annotation.dart';
part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel {
  @JsonKey(name: "username")
  String? userName;
  String? password;
  LoginRequestModel({this.password, this.userName});
  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
