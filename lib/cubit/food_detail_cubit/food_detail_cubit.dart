import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../modals/food_modal.dart';
import '../../repositiory/api_service/detail_service.dart';

part 'food_detail_state.dart';

class FoodDetailCubit extends Cubit<FoodDetailState> {
  FoodDetailCubit(this.cName) : super(FoodDetailInitial()) {
    fetchData(cName);
  }

  final String cName;

  static FoodDetailCubit get(context) => BlocProvider.of(context);
  final DetailService apiService = DetailService();

  void fetchData(String cName) async {
    emit(FoodDetailLoading());
    final data = await apiService.foodDetailFetchData(cName: cName);
    if (data != null) {
      final genshinModal = FoodDetailModal.fromJson(data);
      // MyStorage.setGenshinData(genshinModal);

      emit(FoodDetailLoaded(foodDetailModal: genshinModal));
    } else {
      emit(FoodDetailError(error: 'error'));
    }
  }
}
