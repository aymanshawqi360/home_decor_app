// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'favorite_api_response_model.g.dart';

@JsonSerializable()
class FavoriteApiResponseModel {
  String? message;
  FavoriteApiResponseModel({required this.message});

  factory FavoriteApiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteApiResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteApiResponseModelToJson(this);
}
