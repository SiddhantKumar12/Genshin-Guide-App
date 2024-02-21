import 'package:bloc/bloc.dart';
import 'package:dainsleif_journal/modals/nation_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../repositiory/api_service/detail_service.dart';

part 'nation_detail_state.dart';

class NationDetailCubit extends Cubit<NationDetailState> {
  // NationDetailCubit() : super(NationDetailInitial());

  NationDetailCubit(this.cName) : super(NationDetailInitial()) {
    fetchData(cName);
  }

  final String cName;

  static NationDetailCubit get(context) => BlocProvider.of(context);
  final DetailService apiService = DetailService();

  void fetchData(String cName) async {
    emit(NationDetailLoading());
    final data = await apiService.nationDetailFetchData(cName: cName);
    if (data != null) {
      final genshinModal = NationModal.fromJson(data);
      // MyStorage.setGenshinData(genshinModal);

      emit(NationDetailLoaded(nationModal: genshinModal));
    } else {
      emit(NationDetailError(error: 'error'));
    }
  }
}
