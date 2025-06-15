import 'package:home_decor_app/core/networks/api_error_model.dart';
import 'package:home_decor_app/features/home/domain/entities/slider_entity.dart';

sealed class SliderState {}

class SliderInitial extends SliderState {}

class SliderLoading extends SliderState {
  final List<SliderEntity> silderLoadingLength;

  SliderLoading({required this.silderLoadingLength});
}

class SliderSuccess extends SliderState {
  final List<SliderEntity> sliderList;

  SliderSuccess({required this.sliderList});
}

class SliderFailure extends SliderState {
  final String errorMessage;

  SliderFailure({required this.errorMessage});
}

class SliderWithTimer extends SliderState {
  final int timer;

  SliderWithTimer({required this.timer});
}
