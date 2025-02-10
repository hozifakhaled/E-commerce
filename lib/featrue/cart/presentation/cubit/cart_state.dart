part of 'cart_cubit.dart';


abstract class CartState {}

class CartInitial extends CartState {}
class CartError extends CartState {final String message;
  CartError(this.message);}
class CartSuccess extends CartState {}
