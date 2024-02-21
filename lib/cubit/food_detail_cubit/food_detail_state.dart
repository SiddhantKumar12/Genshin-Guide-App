part of 'food_detail_cubit.dart';

@immutable
abstract class FoodDetailState {}

class FoodDetailInitial extends FoodDetailState {}

class FoodDetailLoading extends FoodDetailState {}

class FoodDetailLoaded extends FoodDetailState {
  final FoodDetailModal foodDetailModal;
  FoodDetailLoaded({required this.foodDetailModal});
}

class FoodDetailError extends FoodDetailState {
  final String error;
  FoodDetailError({required this.error});
}
