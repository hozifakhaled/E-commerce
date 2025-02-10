part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}

class CartSuccess extends CartState {}

class GetCartError extends CartState {
  final String message;
  GetCartError(this.message);
}

class GetCartSuccess extends CartState {
  final List<EntiteyCart> cart;
  GetCartSuccess({ required this.cart});
}

class GetCartLoading extends CartState {}
