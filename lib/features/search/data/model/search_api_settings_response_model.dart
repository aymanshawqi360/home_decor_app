// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'search_api_settings_response_model.g.dart';

@JsonSerializable()
class SearchApiSettingsResponseModel {
  @JsonKey(name: "price_range")
  PriceRange priceRange;
  @JsonKey(name: "banner_id")
  int? bannerId;
  @JsonKey(name: "sub_categories")
  List<SubCategories>? subCategories;
  List<Colors>? colors;
  SearchApiSettingsResponseModel({
    required this.priceRange,
    this.bannerId,
    this.subCategories,
    this.colors,
  });
  factory SearchApiSettingsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchApiSettingsResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchApiSettingsResponseModelToJson(this);
}

@JsonSerializable()
class PriceRange {
  @JsonKey(name: "min_price")
  double? minPrice;
  @JsonKey(name: "max_price")
  double? maxPrice;
  PriceRange({this.maxPrice, this.minPrice});
  factory PriceRange.fromJson(Map<String, dynamic> json) =>
      _$PriceRangeFromJson(json);
  Map<String, dynamic> toJson() => _$PriceRangeToJson(this);
}

@JsonSerializable()
class SubCategories {
  int? id;
  String? name;
  String? icon;
  @JsonKey(name: "main_category_id")
  int? mainCategoryId;
  SubCategories({this.icon, this.id, this.mainCategoryId, this.name});
  factory SubCategories.fromJson(Map<String, dynamic> json) =>
      _$SubCategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$SubCategoriesToJson(this);
}

@JsonSerializable()
class Colors {
  int? id;
  String? name;
  String? hex;
  Colors({this.hex, this.id, this.name});
  factory Colors.fromJson(Map<String, dynamic> json) => _$ColorsFromJson(json);
  Map<String, dynamic> toJson() => _$ColorsToJson(this);
}
