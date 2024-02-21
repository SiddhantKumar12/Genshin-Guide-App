part of 'g_character_detail_cubit.dart';

@immutable
abstract class GCharacterDetailState {}

class GCharacterDetailInitial extends GCharacterDetailState {}

class GCharacterDetailLoading extends GCharacterDetailState {}

class GCharacterDetailLoaded extends GCharacterDetailState {
  final GCharacterDetailModal gCharacterDetailModal;
  GCharacterDetailLoaded({required this.gCharacterDetailModal});
}

class GCharacterDetailError extends GCharacterDetailState {
  final String error;
  GCharacterDetailError({required this.error});
}
