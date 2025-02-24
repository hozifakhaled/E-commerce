part of 'addtocart_cubit.dart';

sealed class AddtocartState extends Equatable {
  const AddtocartState();

  @override
  List<Object> get props => [];
}

final class AddtocartInitial extends AddtocartState {}
final class CartSuccesss extends AddtocartState {}
class CartError extends AddtocartState {
  final String message;
  CartError(this.message);
}

