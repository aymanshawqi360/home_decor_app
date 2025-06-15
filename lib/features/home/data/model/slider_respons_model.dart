import 'package:json_annotation/json_annotation.dart';
part 'slider_respons_model.g.dart';

@JsonSerializable()
class SliderResponsModel {
  @JsonKey(name: "data")
  List<Data>? sliderList;
  SliderResponsModel({this.sliderList});

  factory SliderResponsModel.fromJson(Map<String, dynamic> json) =>
      _$SliderResponsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SliderResponsModelToJson(this);
}

@JsonSerializable()
class Data {
  int? id;
  String? image;
  Data({this.id, this.image});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: "current_page")
  int? currentPage;
  int? from;
  @JsonKey(name: "last_page")
  int? lastPage;
  List<Links>? links;
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
class Links {
  String? first;
  String? last;
  String? prev;
  String? next;
  Links({this.first, this.last, this.next, this.prev});
  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

class ItemsEntitie {
  final int id;
  final String category;
  final String name;
  final double isSale;
  final String salePrice;
  final String color;
  final String image;

  ItemsEntitie({
    required this.category,
    required this.color,
    required this.id,
    required this.image,
    required this.isSale,
    required this.name,
    required this.salePrice,
  });
}
