import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_model.g.dart';

@JsonSerializable()
class SignUpRequestModel {
  @JsonKey(name: "full_name")
  String? fullName;
  String? email;
  @JsonKey(name: "username")
  String? userName;
  @JsonKey(name: "mobile_number")
  String? mobileNumber;
  @JsonKey(name: "date_of_birth")
  String? dateOfBirth;
  String? password;
  @JsonKey(name: "confirm_password")
  String? confirmPassword;

  SignUpRequestModel({
    this.confirmPassword,
    this.dateOfBirth,
    this.email,
    this.fullName,
    this.mobileNumber,
    this.password,
    this.userName,
  });
  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
}
