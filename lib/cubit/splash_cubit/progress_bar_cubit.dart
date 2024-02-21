import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

enum ProgressState { initial, loading, loaded }

class ProgressCubit extends Cubit<double> {
  final int durationInSeconds;
  Timer? _timer;

  ProgressCubit({required this.durationInSeconds}) : super(0.0) {
    startProgress();
  }

  void startProgress() {
    emit(0.0);
    final double step = 1.0 / (durationInSeconds * 10); // Dividing by 10 for smoother animation
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (state < 1.0) {
        emit(state + step);
      } else {
        _timer?.cancel();
        emit(1.0);
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
