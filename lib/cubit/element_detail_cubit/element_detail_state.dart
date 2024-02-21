part of 'element_detail_cubit.dart';

@immutable
abstract class ElementDetailState {}

class ElementDetailInitial extends ElementDetailState {}

class ElementDetailLoading extends ElementDetailState {}

class ElementDetailLoaded extends ElementDetailState {
  final ElementModal elementModal;
  ElementDetailLoaded({required this.elementModal});
}

class ElementDetailError extends ElementDetailState {
  final String error;
  ElementDetailError({required this.error});
}
