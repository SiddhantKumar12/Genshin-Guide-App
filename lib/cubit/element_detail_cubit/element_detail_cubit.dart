import 'package:bloc/bloc.dart';
import 'package:dainsleif_journal/modals/element_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../repositiory/api_service/detail_service.dart';

part 'element_detail_state.dart';

class ElementDetailCubit extends Cubit<ElementDetailState> {
  ElementDetailCubit(this.cName) : super(ElementDetailInitial()) {
    fetchData(cName);
  }

  final String cName;

  static ElementDetailCubit get(context) => BlocProvider.of(context);
  final DetailService apiService = DetailService();

  void fetchData(String cName) async {
    emit(ElementDetailLoading());
    final data = await apiService.elementDetailService(cName: cName);
    if (data != null) {
      final genshinModal = ElementModal.fromJson(data);
      // MyStorage.setGenshinData(genshinModal);

      emit(ElementDetailLoaded(elementModal: genshinModal));
    } else {
      emit(ElementDetailError(error: 'error'));
    }
  }
}
