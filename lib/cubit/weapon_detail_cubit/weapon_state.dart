part of 'weapon_cubit.dart';

@immutable
abstract class WeaponDetailState {}

class WeaponInitial extends WeaponDetailState {}

class WeaponLoading extends WeaponDetailState {}

class WeaponLoaded extends WeaponDetailState {
  final WeaponModal weaponModal;
  WeaponLoaded({required this.weaponModal});
}

class WeaponError extends WeaponDetailState {
  final String error;
  WeaponError({required this.error});
}
