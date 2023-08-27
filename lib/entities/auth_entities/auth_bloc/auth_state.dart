part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthDoneState extends AuthState {
  final String token;

  AuthDoneState({
    required this.token,
  });
}

class AuthFailedState extends AuthState {
  final String message;

  AuthFailedState({
    required this.message,
  });
}

class UnAuthState extends AuthState {
  final String message;

  UnAuthState({required this.message});
}
