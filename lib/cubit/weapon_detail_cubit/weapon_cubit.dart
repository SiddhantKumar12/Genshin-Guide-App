import 'package:bloc/bloc.dart';
import 'package:dainsleif_journal/modals/weapon_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../repositiory/api_service/detail_service.dart';

part 'weapon_state.dart';

class WeaponDetailCubit extends Cubit<WeaponDetailState> {
  WeaponDetailCubit(this.cName) : super(WeaponInitial()) {
    fetchData(cName);
  }

  final String cName;

  static WeaponDetailCubit get(context) => BlocProvider.of(context);
  final DetailService apiService = DetailService();

  void fetchData(String cName) async {
    emit(WeaponLoading());
    final data = await apiService.weaponDetailFetchData(cName: cName);
    if (data != null) {
      final genshinModal = WeaponModal.fromJson(data);
      // MyStorage.setGenshinData(genshinModal);

      emit(WeaponLoaded(weaponModal: genshinModal));
    } else {
      emit(WeaponError(error: 'error'));
    }
  }
}
