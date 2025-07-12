import 'package:equatable/equatable.dart';

class SearchApiSettingsResponseModelEntity {
  final List<SearchSubCategoriesEntity>? subCategories;
  final List<SearchColorsEntity>? colors;
  final SearchPriceRangeEntity? priceRange;

  const SearchApiSettingsResponseModelEntity({
    this.priceRange,
    this.subCategories,
    this.colors,
  });
}

class SearchSubCategoriesEntity extends Equatable {
  final String? icon;
  final int? id;
  final int? mainCategoryId;
  final String? name;
  const SearchSubCategoriesEntity({
    required this.icon,
    required this.id,
    required this.mainCategoryId,
    required this.name,
  });

  @override
  List<Object?> get props => [icon, id, mainCategoryId, name];
}

class SearchPriceRangeEntity extends Equatable {
  final double? maxPrice;

  final double? minPrice;
  const SearchPriceRangeEntity({this.maxPrice, this.minPrice});

  @override
  List<Object?> get props => [maxPrice, minPrice];
}

class SearchColorsEntity extends Equatable {
  final int? id;
  final String? name;
  final String? hex;
  const SearchColorsEntity({
    required this.id,
    required this.name,
    required this.hex,
  });

  @override
  List<Object?> get props => [id, name, hex];
}
