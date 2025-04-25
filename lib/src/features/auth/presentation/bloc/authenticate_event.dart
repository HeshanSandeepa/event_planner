part of 'authenticate_bloc.dart';

@immutable
sealed class AuthenticateEvent {}

class LoginRequested extends AuthenticateEvent {
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});
}

class RegisterRequested extends AuthenticateEvent {
  final String email;
  final String password;

  RegisterRequested({required this.email, required this.password});
}

class GetCurrentUserRequested extends AuthenticateEvent {}

class SignOutRequested extends AuthenticateEvent {}