part of 'g_cubit.dart';

@immutable
abstract class GState {}

class GInitial extends GState {}

class GLoading extends GState {}

class GLoaded extends GState {
  final GModal genshinModal;
  GLoaded({required this.genshinModal});
}

class GError extends GState {
  final String error;
  GError({required this.error});
}
