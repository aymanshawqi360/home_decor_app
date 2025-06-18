import 'package:home_decor_app/core/networks/api_error_model.dart';
import 'package:home_decor_app/features/home/domain/entities/new_collection_entity.dart';

sealed class NewCollectionState {}

class NewCollectionInitial extends NewCollectionState {}

class NewCollectionLoading extends NewCollectionState {}

class NewCollectionSuccess extends NewCollectionState {
  final List<NewCollectionEntity> newCollectionList;

  NewCollectionSuccess({required this.newCollectionList});
}

class NewCollectionFailure extends NewCollectionState {
  final ApiErrorModel errorMessage;

  NewCollectionFailure({required this.errorMessage});
}
