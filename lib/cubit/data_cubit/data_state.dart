part of 'data_cubit.dart';

@immutable
abstract class DataState {}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  final GItemModal gCharacterModal;
  DataLoaded({required this.gCharacterModal});
}

class DataError extends DataState {
  final String error;
  DataError({required this.error});
}
