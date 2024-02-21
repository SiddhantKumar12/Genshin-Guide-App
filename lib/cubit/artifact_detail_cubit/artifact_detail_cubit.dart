import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../modals/artifact_modal.dart';
import '../../repositiory/api_service/detail_service.dart';

part 'artifact_detail_state.dart';

class ArtifactDetailCubit extends Cubit<ArtifactDetailState> {
  ArtifactDetailCubit(this.cName) : super(ArtifactDetailInitial()) {
    fetchData(cName);
  }

  final String cName;

  static ArtifactDetailCubit get(context) => BlocProvider.of(context);
  final DetailService apiService = DetailService();

  void fetchData(String cName) async {
    emit(ArtifactDetailLoading());
    final data = await apiService.artifactDetailFetchData(cName: cName);
    if (data != null) {
      final genshinModal = ArtifactDetailModal.fromJson(data);
      // MyStorage.setGenshinData(genshinModal);

      emit(ArtifactDetailLoaded(artifactDetailModal: genshinModal));
    } else {
      emit(ArtifactDetailError(error: 'error'));
    }
  }
}
