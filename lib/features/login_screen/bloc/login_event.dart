part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class PasswordVisibilityChangeEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class SubmitLogin extends LoginEvent {
  final String username;
  final String password;

  const SubmitLogin({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [username, password];
}
