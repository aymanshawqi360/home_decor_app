import 'package:home_decor_app/features/home/data/model/slider_respons_model.dart';
import 'package:home_decor_app/features/home/domain/entities/slider_entity.dart';

class SliderMappers {
  static SliderEntity toSliderEntity(Data dataResponseModel) {
    return SliderEntity(
      id: dataResponseModel.id ?? 0,
      image: dataResponseModel.image ?? 'defaultImage',
    );
  }
}
