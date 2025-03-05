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
class CartEmpty extends CartState {}
class Cartincrment extends CartState {}
class Cartdecrement extends CartState {}
class GetCartSuccess extends CartState {
  final List<EntiteyCart> cart;
   final bool hasMore;
  GetCartSuccess({ required this.cart,this.hasMore = true});
}

class GetCartLoading extends CartState {}
