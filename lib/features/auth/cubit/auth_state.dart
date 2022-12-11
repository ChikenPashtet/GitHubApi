part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoaded extends AuthState {
  AuthLoaded(this.user);

  final User user;
}

class AuthError extends AuthState {}
