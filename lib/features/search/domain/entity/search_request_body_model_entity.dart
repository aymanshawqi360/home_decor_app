import 'package:equatable/equatable.dart';

class SearchRequestBodyModelEntity extends Equatable {
  final double? minPrice;
  final double? maxPrice;
  final int? colorId;
  final int? subCategoryId;
  final String? searchQuery;

  const SearchRequestBodyModelEntity({
    this.minPrice,
    this.maxPrice,
    this.colorId,
    this.subCategoryId,
    this.searchQuery,
  });

  @override
  List<Object?> get props => [
    minPrice,
    maxPrice,
    colorId,
    subCategoryId,
    searchQuery,
  ];
}
