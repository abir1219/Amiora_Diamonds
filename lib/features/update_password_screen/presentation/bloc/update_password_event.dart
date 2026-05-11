part of 'update_password_bloc.dart';

sealed class UpdatePasswordEvent extends Equatable {
  const UpdatePasswordEvent();
}

final class UpdatePassword extends UpdatePasswordEvent {
  final String? username;
  final String? password;

  const UpdatePassword({this.username, this.password});

  @override
  List<Object?> get props => [username,password];

}

class PasswordVisibilityChangeEvent extends UpdatePasswordEvent{
  @override
  List<Object?> get props => [];

}

class ConfirmPasswordVisibilityChangeEvent extends UpdatePasswordEvent{
  @override
  List<Object?> get props => [];

}
