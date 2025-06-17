import 'package:bloc/bloc.dart';

import 'package:home_decor_app/core/networks/api_resulte.dart';
import 'package:home_decor_app/features/home/domain/entities/slider_entity.dart';
import 'package:home_decor_app/features/home/domain/use_cases/slider_use_cases.dart';
import 'package:home_decor_app/features/home/presentation/cubit/cubit/slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  final SliderUseCases _sliderUseCases;
  SliderCubit(this._sliderUseCases) : super(SliderInitial());
  List<SliderEntity> sliderLoadingLength = [];
  int timer = 0;

  void getSlider() async {
    emit(SliderLoading(silderLoadingLength: sliderLoadingLength));
    final response = await _sliderUseCases.getSlider();

    if (response is Success<List<SliderEntity>>) {
      sliderLoadingLength = response.data!;

      emit(SliderSuccess(sliderList: response.data ?? []));
    } else if (response is Failure<List<SliderEntity>>) {
      emit(
        SliderFailure(
          // errorMessage: ApiErrorModel(
          //   message: response.errorMessage!.message.toString(),
          // ),
          errorMessage: response.errorMessage?.message ?? "Unknown error",
        ),
      );
    }
  }

  void sliderWithTimerForPagView(int index) {
    timer = index;

    emit(SliderWithTimer(timer: index));
  }
}
