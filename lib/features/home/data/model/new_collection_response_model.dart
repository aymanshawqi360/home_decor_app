import 'package:home_decor_app/features/home/data/model/best_seller_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'new_collection_response_model.g.dart';

@JsonSerializable()
class NewCollectionResponseModel {
  @JsonKey(name: "data")
  List<Data>? newCollectionList;
  Links? links;
  Meta? meta;
  NewCollectionResponseModel({this.newCollectionList, this.links, this.meta});
  factory NewCollectionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NewCollectionResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewCollectionResponseModelToJson(this);
}
