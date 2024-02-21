import 'package:bloc/bloc.dart';
import 'package:dainsleif_journal/modals/g_character_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../repositiory/api_service/api_strings.dart';
import '../../repositiory/api_service/g_character_service.dart';
part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());

  static DataCubit get(context) => BlocProvider.of(context);
  final GCharacterItems apiService = GCharacterItems();

  void fetchData(String item) async {
    emit(DataLoading());
    final data = await apiService.fetchData(item: item);
    if (data != null) {
      final genshinModal = GItemModal(name: data);
      // MyStorage.setGenshinData(genshinModal);

      emit(DataLoaded(gCharacterModal: genshinModal));
    } else {
      emit(DataError(error: 'error'));
    }
  }
}
