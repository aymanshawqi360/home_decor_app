import 'package:bloc/bloc.dart';
import 'package:home_decor_app/core/networks/api_error_model.dart';
import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/home/domain/entities/best_seller_entity.dart';
import 'package:home_decor_app/features/home/domain/use_cases/best_seller_use_cases.dart';
import 'package:home_decor_app/features/home/presentation/cubit/show_more_best_seller/show_more_best_seller_state.dart';

class ShowMoreBestSellerCubit extends Cubit<ShowMoreBestSellerState> {
  final BestSellerUseCases _bestSellerUseCases;
  ShowMoreBestSellerCubit(this._bestSellerUseCases)
    : super(ShowMoreBestSellerInitial());

  void getShowMore() async {
    emit(ShowMoreBestSellerLoading());
    final response = await _bestSellerUseCases.getBestSeller();
    if (response is Success<List<BestSellerEntity>>) {
      emit(ShowMoreBestSellerSuccess(bestSellerEntity: response.data ?? []));
    } else if (response is Failure<List<BestSellerEntity>>) {
      emit(
        ShowMoreBestSellerFailure(
          errorMessage: ApiErrorModel(
            errorMessage: response.errorMessage!.errorMessage,
          ),
        ),
      );
    }
  }
}
