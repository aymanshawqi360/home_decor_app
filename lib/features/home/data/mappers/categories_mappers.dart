import 'package:home_decor_app/features/home/data/model/categories_response_model.dart';
import 'package:home_decor_app/features/home/domain/entities/categories_entity.dart';

class CategoriesMappers {
  static CategoriesEntity toCategoriesEntity(Data categoriesDataResponseModel) {
    return CategoriesEntity(
      id: categoriesDataResponseModel.id ?? 0,
      icon: categoriesDataResponseModel.icon ?? "defultIcon",
      name: categoriesDataResponseModel.name ?? "defultName",
    );
  }
}
