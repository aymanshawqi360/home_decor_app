import 'package:home_decor_app/features/home/data/model/best_seller_response_model.dart';
import 'package:home_decor_app/features/home/domain/entities/new_collection_entity.dart';

class NewColectionMappers {
  static NewCollectionEntity getNewCollection(Data dataResponseModel) {
    return NewCollectionEntity(
      id: dataResponseModel.id ?? 0,
      description: dataResponseModel.description ?? "defaultDescription",
      image: dataResponseModel.image ?? "defaultImage",
      name: dataResponseModel.name ?? "defaultName",
      salePrice: dataResponseModel.salePrice ?? 12.00,
    );
  }
}
