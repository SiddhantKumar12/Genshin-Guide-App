import 'package:bloc/bloc.dart';
import 'package:dainsleif_journal/repositiory/api_service/detail_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../modals/g_character_detail_modal.dart';
part 'g_character_detail_state.dart';

class GCharacterDetailCubit extends Cubit<GCharacterDetailState> {
  GCharacterDetailCubit(this.cName) : super(GCharacterDetailInitial()) {
    fetchData(cName);
  }

  final String cName;

  static GCharacterDetailCubit get(context) => BlocProvider.of(context);
  final DetailService apiService = DetailService();

  void fetchData(String cName) async {
    emit(GCharacterDetailInitial());
    final data = await apiService.gCharacterDetailFetchData(cName: cName);
    if (data != null) {
      final genshinModal = GCharacterDetailModal.fromJson(data);
      // MyStorage.setGenshinData(genshinModal);

      emit(GCharacterDetailLoaded(gCharacterDetailModal: genshinModal));
    } else {
      emit(GCharacterDetailError(error: 'error'));
    }
  }
}
