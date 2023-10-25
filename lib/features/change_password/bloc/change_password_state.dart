part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordDoneState extends ChangePasswordState {
  final UserModel? user;

  ChangePasswordDoneState({
    required this.user,
  });
}

class ChangePasswordFailedState extends ChangePasswordState {
  final String message;

  ChangePasswordFailedState({
    required this.message,
  });
}

class UnAuthState extends ChangePasswordState {
  final String message;

  UnAuthState({required this.message});
}
