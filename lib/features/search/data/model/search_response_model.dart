import 'package:json_annotation/json_annotation.dart';
part 'search_response_model.g.dart';

@JsonSerializable()
class SearchResponseModel {
  List<Items>? items;
  int? count;
  SearchResponseModel({this.count, this.items});
  factory SearchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResponseModelToJson(this);
}

@JsonSerializable()
class Items {
  int? id;
  @JsonKey(name: "sub_category_id")
  String? subCategoryId;
  String? color;
  String? name;
  String? description;
  double? price;
  @JsonKey(name: "is_sale")
  bool? isSale;
  @JsonKey(name: "sale_price")
  double? salePrice;
  String? image;
  double? rate;
  Items({
    this.color,
    this.description,
    this.id,
    this.image,
    this.isSale,
    this.name,
    this.price,
    this.rate,
    this.salePrice,
    this.subCategoryId,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
