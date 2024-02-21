part of 'domain_detail_cubit.dart';

@immutable
abstract class DomainDetailState {}

class DomainDetailInitial extends DomainDetailState {}

class DomainDetailLoading extends DomainDetailState {}

class DomainDetailLoaded extends DomainDetailState {
  final DomainModal domainModal;
  DomainDetailLoaded({required this.domainModal});
}

class DomainDetailError extends DomainDetailState {
  final String error;
  DomainDetailError({required this.error});
}
