import 'package:bloc/bloc.dart';
import 'package:home_decor_app/core/networks/api_error_model.dart';
import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/home/domain/entities/best_seller_entity.dart';
import 'package:home_decor_app/features/home/domain/use_cases/best_seller_use_cases.dart';
import 'package:home_decor_app/features/home/presentation/cubit/best_seller/best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  final BestSellerUseCases _bestSellerUseCases;
  BestSellerCubit(this._bestSellerUseCases) : super(BestSellerInitial());

  void getBestSellet() async {
    emit(BestSellerLoading());

    final response = await _bestSellerUseCases.getBestSeller();
    if (response is Success<List<BestSellerEntity>>) {
      emit(BestSellerSuccess(bestSellerEntity: response.data ?? []));
    } else if (response is Failure<List<BestSellerEntity>>) {
      emit(
        BestSellerFailure(
          errorMessage: ApiErrorModel(
            message: response.errorMessage!.message.toString(),
          ),
        ),
      );
    }
  }
}
