import 'package:equatable/equatable.dart';
import 'package:home_decor_app/core/networks/api_error_model.dart';
import 'package:home_decor_app/features/favorite/domain/entity/list_favorite_api_response_entity.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {
  @override
  List<Object> get props => [];
}

class AddingFavoriteLoading extends FavoriteState {
  @override
  List<Object> get props => [];
}

class AddingFavoriteSuccess extends FavoriteState {
  final String message;
  const AddingFavoriteSuccess({required this.message});
  @override
  List<Object> get props => [message];
}

class AddingFavoriteFailure extends FavoriteState {
  final ApiErrorModel errorMessage;
  const AddingFavoriteFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class GetFavoriteLoading extends FavoriteState {
  @override
  List<Object> get props => [];
}

class GetFavoriteSuccess extends FavoriteState {
  final List<ListFavoriteApiResponseEntity> listFavorite;
  const GetFavoriteSuccess({required this.listFavorite});
  @override
  List<Object> get props => [listFavorite];
}

class GetFavoriteFailure extends FavoriteState {
  final ApiErrorModel errorMessage;
  const GetFavoriteFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class GetIsFavorite extends FavoriteState {
  final bool favorite;
  const GetIsFavorite({required this.favorite});
  @override
  List<Object> get props => [favorite];
}
