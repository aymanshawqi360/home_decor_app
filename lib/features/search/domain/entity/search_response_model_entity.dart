// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SearchResponseModelEntity extends Equatable {
  final int? id;
  final String? subCategoryId;
  final String? color;
  final String? name;
  final String? description;
  final double? price;
  final bool? isSale;
  final double? salePrice;
  final String? image;
  final double? rate;

  const SearchResponseModelEntity({
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
