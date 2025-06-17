import 'package:bloc/bloc.dart';

import 'package:home_decor_app/core/networks/api_error_model.dart';
import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/home/domain/entities/categories_entity.dart';
import 'package:home_decor_app/features/home/domain/use_cases/categories_use_cases.dart';
import 'package:home_decor_app/features/home/presentation/cubit/categories/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesUseCases _categoriesUseCases;
  int selectionNumber = -1;
  CategoriesCubit(this._categoriesUseCases) : super(CategoriesInitial());

  void getCategories() async {
    emit(CategoriesLoading());
    final response = await _categoriesUseCases.getCategories();

    if (response is Success<List<CategoriesEntity>>) {
      print(response.data.toString());
      emit(CategoriesSuccess(categoriesEntity: response.data!));
    } else if (response is Failure<List<CategoriesEntity>>) {
      emit(
        CategoriesFailure(
          errorMessage: ApiErrorModel(
            message: response.errorMessage!.message.toString(),
          ),
        ),
      );
    }
  }

  void categorySelection(int index) {
    selectionNumber = index;
    emit(CategoriesSelection(selectionNumber: selectionNumber));
  }
}
