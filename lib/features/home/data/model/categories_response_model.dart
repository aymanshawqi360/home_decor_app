import 'package:json_annotation/json_annotation.dart';
part 'categories_response_model.g.dart';

@JsonSerializable()
class CategoriesResponseModel {
  @JsonKey(name: "data")
  List<Data>? categoriesList;

  CategoriesResponseModel({this.categoriesList});
  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  int? id;
  String? name;
  String? icon;
  Data({this.id, this.name, this.icon});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
