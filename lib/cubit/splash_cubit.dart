import 'dart:async';
import 'package:bloc/bloc.dart';

enum SplashState { loading, loaded }

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.loading) {
    loadData();
  }

  void loadData() {
    Timer(const Duration(seconds: 3), () {
      emit(SplashState.loaded);
    });
  }
}
