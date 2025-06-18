import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/home/domain/entities/new_collection_entity.dart';
import 'package:home_decor_app/features/home/domain/repo/home_repo.dart';

class NewCollectionUseCases {
  final HomeRepo _homeRepo;
  NewCollectionUseCases(this._homeRepo);

  Future<ApiResulte<List<NewCollectionEntity>>> getNewCollectionEntity() async {
    return await _homeRepo.getNewCollectionEntity();
  }
}
