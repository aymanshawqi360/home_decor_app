import 'package:bloc/bloc.dart';
import 'package:home_decor_app/core/networks/api_error_model.dart';
import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/home/domain/entities/new_collection_entity.dart';
import 'package:home_decor_app/features/home/domain/use_cases/new_collection_use_cases.dart';
import 'package:home_decor_app/features/home/presentation/cubit/new_collection/new_collection_state.dart';

class NewCollectionCubit extends Cubit<NewCollectionState> {
  final NewCollectionUseCases _newCollectionUseCases;
  NewCollectionCubit(this._newCollectionUseCases)
    : super(NewCollectionInitial());

  void getNewCollection() async {
    emit(NewCollectionLoading());
    final response = await _newCollectionUseCases.getNewCollectionEntity();
    if (response is Success<List<NewCollectionEntity>>) {
      emit(NewCollectionSuccess(newCollectionList: response.data ?? []));
    } else if (response is Failure<List<NewCollectionEntity>>) {
      emit(
        NewCollectionFailure(
          errorMessage: ApiErrorModel(
            message: response.errorMessage!.message.toString(),
          ),
        ),
      );
    }
  }
}
