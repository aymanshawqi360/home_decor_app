import 'package:home_decor_app/core/networks/api_error_model.dart';
import 'package:home_decor_app/features/home/domain/entities/best_seller_entity.dart';

class ShowMoreBestSellerState {}

class ShowMoreBestSellerInitial extends ShowMoreBestSellerState {}

class ShowMoreBestSellerLoading extends ShowMoreBestSellerState {}

class ShowMoreBestSellerSuccess extends ShowMoreBestSellerState {
  final List<BestSellerEntity> bestSellerEntity;

  ShowMoreBestSellerSuccess({required this.bestSellerEntity});
}

class ShowMoreBestSellerFailure extends ShowMoreBestSellerState {
  final ApiErrorModel errorMessage;

  ShowMoreBestSellerFailure({required this.errorMessage});
}
