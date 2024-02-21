import 'package:bloc/bloc.dart';
import 'package:dainsleif_journal/modals/domain_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../repositiory/api_service/detail_service.dart';

part 'domain_detail_state.dart';

class DomainDetailCubit extends Cubit<DomainDetailState> {
  DomainDetailCubit(this.cName) : super(DomainDetailInitial()) {
    fetchData(cName);
  }

  final String cName;

  static DomainDetailCubit get(context) => BlocProvider.of(context);
  final DetailService apiService = DetailService();

  void fetchData(String cName) async {
    emit(DomainDetailLoading());
    final data = await apiService.domainDetailFetchData(cName: cName);
    if (data != null) {
      final genshinModal = DomainModal.fromJson(data);
      // MyStorage.setGenshinData(genshinModal);

      emit(DomainDetailLoaded(domainModal: genshinModal));
    } else {
      emit(DomainDetailError(error: 'error'));
    }
  }
}
