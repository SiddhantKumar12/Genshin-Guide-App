part of 'artifact_detail_cubit.dart';

@immutable
abstract class ArtifactDetailState {}

class ArtifactDetailInitial extends ArtifactDetailState {}

class ArtifactDetailLoading extends ArtifactDetailState {}

class ArtifactDetailLoaded extends ArtifactDetailState {
  final ArtifactDetailModal artifactDetailModal;
  ArtifactDetailLoaded({required this.artifactDetailModal});
}

class ArtifactDetailError extends ArtifactDetailState {
  final String error;
  ArtifactDetailError({required this.error});
}
