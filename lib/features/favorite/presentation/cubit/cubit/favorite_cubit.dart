import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor_app/core/networks/api_error_model.dart';
import 'package:home_decor_app/core/networks/api_result.dart';
import 'package:home_decor_app/features/favorite/domain/entity/favorite_api_response_entity.dart';
import 'package:home_decor_app/features/favorite/domain/entity/list_favorite_api_response_entity.dart';
import 'package:home_decor_app/features/favorite/domain/use_cases/favorite_api_use_cases.dart';
import 'package:home_decor_app/features/favorite/presentation/cubit/cubit/favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteApiUseCases favoriteApiUseCases;
  FavoriteCubit({required this.favoriteApiUseCases}) : super(FavoriteInitial());
  static FavoriteCubit get(context) => BlocProvider.of(context);
  bool? isFavorite;
  void addingFavorite({required String path}) async {
    emit(AddingFavoriteLoading());
    final response = await favoriteApiUseCases.addingFavorite(path: path);

    if (response is Success<FavoriteApiResponseEntity>) {
      await getListFavorite();
      emit(AddingFavoriteSuccess(message: response.data?.message ?? ""));
    } else if (response is Failure<FavoriteApiResponseEntity>) {
      emit(
        AddingFavoriteFailure(
          errorMessage: ApiErrorModel(
            errorMessage:
                response.errorMessage?.errorMessage ?? "Unknown error occurred",
          ),
        ),
      );
    }
  }

  List<ListFavoriteApiResponseEntity> listFavorite = [];
  Future<void> getListFavorite() async {
    emit(GetFavoriteLoading());

    final response = await favoriteApiUseCases.getListFavorite();
    if (response is Success<List<ListFavoriteApiResponseEntity>>) {
      listFavorite = response.data ?? [];

      emit(GetFavoriteSuccess(listFavorite: listFavorite));
    } else if (response is Failure<List<ListFavoriteApiResponseEntity>>) {
      emit(
        GetFavoriteFailure(
          errorMessage: ApiErrorModel(
            errorMessage:
                response.errorMessage?.errorMessage ?? "Unknown error occurred",
          ),
        ),
      );
    }
  }

  bool checkFavorite(int id) {
    bool? isFavorite = listFavorite.any((testValue) => testValue.id == id);

    return isFavorite;
  }

  bool delete = false;
  void checkIconDelete() {
    delete = !delete;
    emit(GetIsFavorite(favorite: delete));
  }
}
