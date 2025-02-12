part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}
class ProfileLoaded extends ProfileState {
  final ProfileEntitiey profileEntitiey;
  ProfileLoaded(this.profileEntitiey);
}
class ProfileError extends ProfileState {
  final String error;
  ProfileError(this.error);
}

