import 'package:equatable/equatable.dart';

class ListFavoriteApiResponseEntity extends Equatable {
  final int? id;
  final String? subCategoryId;
  final String? color;
  final String? name;
  final String? description;
  final double? price;
  final bool? isSale;
  final dynamic salePrice;
  final String? image;
  final double? rate;

  const ListFavoriteApiResponseEntity({
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

  @override
  List<Object?> get props => [
    id,
    subCategoryId,
    color,
    name,
    description,
    price,
    isSale,
    salePrice,
    image,
    rate,
  ];
}
