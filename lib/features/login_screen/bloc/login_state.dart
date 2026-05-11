part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String? message;
  final bool isVisible;

  final LoginModel? loginModel;
  final ApiStatus apiStatus;

  const LoginState({
    this.message,
    this.loginModel,
    this.isVisible = true,
    this.apiStatus = ApiStatus.initial,
  });

  LoginState copyWith(
      {bool? isVisible,
      String? message,
      ApiStatus? apiStatus,
      LoginModel? loginModel}) {
    return LoginState(
        message: message ?? this.message,
        loginModel: loginModel ?? this.loginModel,
        isVisible: isVisible ?? this.isVisible,
        apiStatus: apiStatus ?? this.apiStatus);
  }

  @override
  List<Object?> get props => [
        apiStatus,
        message,
        isVisible,
        loginModel,
      ];
}
