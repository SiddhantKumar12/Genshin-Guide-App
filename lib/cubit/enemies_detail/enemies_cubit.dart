import 'package:bloc/bloc.dart';
import 'package:dainsleif_journal/modals/enemies_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../repositiory/api_service/detail_service.dart';

part 'enemies_state.dart';

class EnemiesCubit extends Cubit<EnemiesState> {
  EnemiesCubit(this.cName) : super(EnemiesInitial()) {
    fetchData(cName);
  }

  final String cName;

  static EnemiesCubit get(context) => BlocProvider.of(context);
  final DetailService apiService = DetailService();

  void fetchData(String cName) async {
    emit(EnemiesLoading());
    final data = await apiService.enemiesDetailService(cName: cName);
    if (data != null) {
      final genshinModal = EnemiesModal.fromJson(data);
      // MyStorage.setGenshinData(genshinModal);

      emit(EnemiesLoaded(enemiesModal: genshinModal));
    } else {
      emit(EnemiesError(error: 'error'));
    }
  }
}
