import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:home_decor_app/core/networks/api_error_model.dart';
import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/home/domain/entities/categories_entity.dart';
import 'package:home_decor_app/features/home/domain/use_cases/categories_use_cases.dart';
import 'package:home_decor_app/features/home/presentation/cubit/show_more/show_more_state.dart';

class ShowMoreCubit extends Cubit<ShowMoreState> {
  final CategoriesUseCases _categoriesUseCases;
  List<CategoriesEntity> showMoreList = [];
  ShowMoreCubit(this._categoriesUseCases) : super(ShowMoreInitial());

  getShowMore() async {
    emit(ShowMoreLoading());

    final response = await _categoriesUseCases.getShowMore();
    if (response is Success<List<CategoriesEntity>>) {
      showMoreList = response.data!;
      emit(ShowMoreSuccess(categoriesEntity: response.data ?? []));
    } else if (response is Failure<List<CategoriesEntity>>) {
      emit(
        ShowMoreFailure(
          errorMessage: ApiErrorModel(
            errorMessage: response.errorMessage!.errorMessage.toString(),
          ),
        ),
      );
    }
  }
}
