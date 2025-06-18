import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/home/domain/entities/slider_entity.dart';
import 'package:home_decor_app/features/home/domain/repo/home_repo.dart';

class SliderUseCases {
  final HomeRepo _homeRepo;
  SliderUseCases(this._homeRepo);
  Future<ApiResulte<List<SliderEntity>>> getSlider() async {
    return await _homeRepo.getSlider();
  }
}
