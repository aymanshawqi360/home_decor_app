import 'package:home_decor_app/core/networks/api_error_model.dart';
import 'package:home_decor_app/features/home/domain/entities/best_seller_entity.dart';

sealed class BestSellerState {}

class BestSellerInitial extends BestSellerState {}

class BestSellerLoading extends BestSellerState {}

class BestSellerSuccess extends BestSellerState {
  final List<BestSellerEntity> bestSellerEntity;

  BestSellerSuccess({required this.bestSellerEntity});
}

class BestSellerFailure extends BestSellerState {
  final ApiErrorModel errorMessage;

  BestSellerFailure({required this.errorMessage});
}
