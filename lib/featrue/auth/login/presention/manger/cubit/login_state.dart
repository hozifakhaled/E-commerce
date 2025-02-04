part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoaded extends LoginState {}

final class LoginError extends LoginState {
  final String massge;

  LoginError({required this.massge});
}

final class LoginLoading extends LoginState {}
