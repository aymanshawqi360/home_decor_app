import 'package:home_decor_app/features/home/data/model/best_seller_response_model.dart';
import 'package:home_decor_app/features/home/domain/entities/best_seller_entity.dart';

class BestSellerMappers {
  static BestSellerEntity toBestSellerEntity(Data dataresponseModel) {
    return BestSellerEntity(
      id: dataresponseModel.id ?? 0,
      description: dataresponseModel.description ?? "defaultDescription",
      image: dataresponseModel.image ?? "defaultImage",
      rate: dataresponseModel.rate ?? 4.3,
      name: dataresponseModel.name ?? "defaultName",
    );
  }
}
