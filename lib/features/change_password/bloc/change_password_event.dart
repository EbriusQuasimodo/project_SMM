part of 'change_password_bloc.dart';

@immutable
abstract class ChangePasswordEvent {}

class ChangePersonPasswordEvent extends ChangePasswordEvent {
  final String oldPassword;
  final String newPassword;

  ChangePersonPasswordEvent({
    required this.oldPassword,
    required this.newPassword,
  });
}
