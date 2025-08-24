import 'package:json_annotation/json_annotation.dart';
part 'list_favorite_api_response_model.g.dart';

@JsonSerializable()
class ListFavoriteApiResponseModel {
  final int? id;
  @JsonKey(name: "sub_category_id")
  final String? subCategoryId;
  final String? color;
  final String? name;
  final String? description;
  final double? price;
  @JsonKey(name: "is_sale")
  final bool? isSale;
  final dynamic salePrice;
  final String? image;
  final double? rate;

  ListFavoriteApiResponseModel({
    this.id,
    this.subCategoryId,
    this.color,
    this.name,
    this.description,
    this.price,
    this.isSale,
    this.salePrice,
    this.image,
    this.rate,
  });
  factory ListFavoriteApiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ListFavoriteApiResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListFavoriteApiResponseModelToJson(this);
}
