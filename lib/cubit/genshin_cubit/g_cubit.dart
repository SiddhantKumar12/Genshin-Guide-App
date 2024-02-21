import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../modals/g_modal.dart';
import '../../repositiory/api_service/g_service.dart';
import '../../repositiory/dio/dio_error_helper.dart';
import '../../repositiory/dio/dio_api_helper.dart';
import '../../repositiory/local_storage/local_storage.dart';

part 'g_state.dart';

class GCubit extends Cubit<GState> {
  GCubit() : super(GInitial()) {
    fetchData();
  }

  static GCubit get(context) => BlocProvider.of(context);
  final GService apiService = GService();

  void fetchData() async {
    final data = await apiService.fetchData();
    if (data != null) {
      final genshinModal = GModal.fromJson(data);
      MyStorage.setGenshinData(genshinModal);

      emit(GLoaded(genshinModal: genshinModal));
    } else {
      emit(GError(error: 'error'));
    }
  }

  @override
  Future<void> close() {
    fetchData();
    return super.close();
  }
}
