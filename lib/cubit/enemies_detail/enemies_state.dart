part of 'enemies_cubit.dart';

@immutable
abstract class EnemiesState {}

class EnemiesInitial extends EnemiesState {}

class EnemiesLoading extends EnemiesState {}

class EnemiesLoaded extends EnemiesState {
  final EnemiesModal enemiesModal;
  EnemiesLoaded({required this.enemiesModal});
}

class EnemiesError extends EnemiesState {
  final String error;
  EnemiesError({required this.error});
}
