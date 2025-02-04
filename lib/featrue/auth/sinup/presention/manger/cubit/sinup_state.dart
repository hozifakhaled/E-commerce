part of 'sinup_cubit.dart';

@immutable
sealed class SinupState {}

final class SinupInitial extends SinupState {}
final class SinupLoaded extends SinupState {}
final class SinupError extends SinupState {
  final String message;
  SinupError(this.message);
}
final class SinupLoading extends SinupState {}

