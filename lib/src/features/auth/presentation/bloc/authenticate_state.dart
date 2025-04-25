part of 'authenticate_bloc.dart';

@immutable
sealed class AuthenticateState {}

final class AuthInitial extends AuthenticateState {}

final class AuthLoading extends AuthenticateState {}

final class Authenticated extends AuthenticateState {
  final UserEntity user;

  Authenticated({required this.user});
}

final class InitialAuthenticated extends AuthenticateState {
  final UserEntity user;

  InitialAuthenticated({required this.user});
}

final class Unauthenticated extends AuthenticateState {}

final class AuthFailure extends AuthenticateState {
  final String message;

  AuthFailure({required this.message});
}
