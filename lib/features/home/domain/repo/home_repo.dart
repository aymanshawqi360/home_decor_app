import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/home/domain/entities/slider_entity.dart';

abstract class HomeRepo {
  Future<ApiResulte<List<SliderEntity>>> getSlider();
}
