import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/home/domain/entities/best_seller_entity.dart';
import 'package:home_decor_app/features/home/domain/repo/home_repo.dart';

class BestSellerUseCases {
  final HomeRepo _homeRepo;
  BestSellerUseCases(this._homeRepo);
  Future<ApiResulte<List<BestSellerEntity>>> getBestSeller() {
    return _homeRepo.getBestSeller();
  }
}
