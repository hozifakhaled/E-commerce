part of 'checkout_cubit.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

class CheckoutInitial extends CheckoutState {}
class CheckoutLoading extends CheckoutState {}
class CheckoutError extends CheckoutState {
  final String message;
  const CheckoutError(this.message);
}
class CheckoutLoaded extends CheckoutState {}
