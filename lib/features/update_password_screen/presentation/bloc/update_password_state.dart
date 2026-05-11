part of 'update_password_bloc.dart';

class UpdatePasswordState extends Equatable {
  final String? message;
  final bool? isPwVisible;
  final bool? isCnPwVisible;
  final ApiStatus? apiStatus;

  const UpdatePasswordState({
    this.message,
    this.isPwVisible = false,
    this.isCnPwVisible = false,
    this.apiStatus = ApiStatus.initial,
  });

  UpdatePasswordState copyWith({
    String? message, bool? isPwVisible, bool? isCnPwVisible, ApiStatus? apiStatus
  }) {
    return UpdatePasswordState(
      message: message ?? this.message ,
      isPwVisible: isPwVisible ?? this.isPwVisible,
      isCnPwVisible: isCnPwVisible ?? this.isCnPwVisible ,
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props =>
      [
        message,
        isPwVisible,
        isCnPwVisible,
        apiStatus,
      ];
}
