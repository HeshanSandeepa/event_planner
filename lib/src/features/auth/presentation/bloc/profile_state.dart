part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileImageUpdated extends ProfileState {}

final class ProfileUpdated extends ProfileState {}

final class ProfileFailure extends ProfileState {
  final String message;

  ProfileFailure({required this.message});
}

final class CurrentProfileGot extends ProfileState {
  final UserEntity user;

  CurrentProfileGot({required this.user});
}
