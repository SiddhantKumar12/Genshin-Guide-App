part of 'nation_detail_cubit.dart';

@immutable
abstract class NationDetailState {}

class NationDetailInitial extends NationDetailState {}

class NationDetailLoading extends NationDetailState {}

class NationDetailLoaded extends NationDetailState {
  final NationModal nationModal;
  NationDetailLoaded({required this.nationModal});
}

class NationDetailError extends NationDetailState {
  final String error;
  NationDetailError({required this.error});
}
