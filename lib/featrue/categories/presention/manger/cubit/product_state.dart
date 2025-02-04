part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

// ignore: must_be_immutable
final class ProductLoaded extends ProductState {
  List<ProductEntitiy> data;
  ProductLoaded({required this.data});
}

final class ProductFailure extends ProductState {

  final String errorMessage;
  ProductFailure({required this.errorMessage});
}
