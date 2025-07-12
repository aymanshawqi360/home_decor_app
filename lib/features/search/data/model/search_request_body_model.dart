import 'package:json_annotation/json_annotation.dart';
part 'search_request_body_model.g.dart';

@JsonSerializable()
class SearchRequestBodyModel {
  @JsonKey(name: "min_price")
  double? minPrice;
  @JsonKey(name: "max_price")
  double? maxPrice;
  @JsonKey(name: "color_id")
  int? colorId;
  @JsonKey(name: "sub_category_id")
  int? subCategoryId;
  @JsonKey(name: "search_query")
  String? searchQuery;
  SearchRequestBodyModel({
    this.colorId,
    this.maxPrice,
    this.minPrice,
    this.searchQuery,
    this.subCategoryId,
  });
  factory SearchRequestBodyModel.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestBodyModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchRequestBodyModelToJson(this);
}
