part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class BestSelingLoading extends HomeState {}
final class BestSelingError extends HomeState {
  final String errorMessage;
  BestSelingError({
    required this.errorMessage,
  });
}
final class BestSelingSuccess extends HomeState {
  final List<ProductEntitiy> productModelList;
  BestSelingSuccess({
    required this.productModelList,
  });
}
