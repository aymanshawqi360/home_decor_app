import 'package:json_annotation/json_annotation.dart';
part 'best_seller_response_model.g.dart';

@JsonSerializable()
class BestSellerResponseModel {
  @JsonKey(name: "data")
  List<Data>? bestSellerList;
  Links? links;
  Meta? meta;
  BestSellerResponseModel({this.bestSellerList, this.links, this.meta});
  factory BestSellerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BestSellerResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$BestSellerResponseModelToJson(this);
}

@JsonSerializable()
class Data {
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
  Data({
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
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Links {
  String? first;
  String? last;
  String? prev;
  String? next;
  Links({this.first, this.last, this.next, this.prev});
  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: "current_page")
  int? currentPage;
  int? from;
  @JsonKey(name: "last_page")
  int? lastPage;

  List<MetaLinks>? links;
  String? path;
  @JsonKey(name: "per_page")
  int? perPage;
  int? to;
  int? total;
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });
  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class MetaLinks {
  String? url;
  String? label;
  bool? active;
  MetaLinks([this.url, this.active, this.label]);
  factory MetaLinks.fromJson(Map<String, dynamic> json) =>
      _$MetaLinksFromJson(json);
  Map<String, dynamic> toJson() => _$MetaLinksToJson(this);
}
