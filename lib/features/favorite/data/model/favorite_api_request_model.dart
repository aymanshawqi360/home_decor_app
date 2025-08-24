import 'package:json_annotation/json_annotation.dart';
part 'favorite_api_request_model.g.dart';

@JsonSerializable()
class FavoriteApiRequestModel {
  int? path;
  FavoriteApiRequestModel({required this.path});

  factory FavoriteApiRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteApiRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteApiRequestModelToJson(this);
}
