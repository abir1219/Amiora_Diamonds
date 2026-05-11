import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../../core/local/shared_preferences_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/api_status.dart';
import '../../../core/constants/app_constants.dart';
import '../data/model/login_model.dart';
import '../data/repository/login_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  var loginRepository = LoginRepository();

   LoginBloc(this.loginRepository) : super(const LoginState()) {
    on<PasswordVisibilityChangeEvent>(_passwordVisibility);
    on<SubmitLogin>(_submitLogin);
  }

  FutureOr<void> _passwordVisibility(
      PasswordVisibilityChangeEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(isVisible: !state.isVisible));
  }

  FutureOr<void> _submitLogin(
      SubmitLogin event, Emitter<LoginState> emit) async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    Map<String, dynamic> body = {
      'username': event.username,
      'password': event.password
    };

    await loginRepository.loginApi(body).then(
      (value) async {
        debugPrint("Login value--->$value");
        var loginModel = LoginModel.fromJson(value);
        /*if (loginModel.accessToken != null) {
          SharedPreferencesHelper.saveString(
              AppConstants.ACCESS_TOKEN, loginModel.accessToken!);
        }
        if (loginModel.refreshToken != null) {
          SharedPreferencesHelper.saveString(
              AppConstants.REFRESH_TOKEN, loginModel.refreshToken!);
        }*/
        // debugPrint("LoginModel value--->${loginModel.manualEntry}");
        if (loginModel.warehouse![0].username != null) {
          SharedPreferencesHelper.saveString(AppConstants.USER_NAME, loginModel.warehouse![0].username!);
          SharedPreferencesHelper.saveString(AppConstants.WAREHOUSE, loginModel.warehouse![0].whCode!);
          SharedPreferencesHelper.saveString(AppConstants.LEGAL_ENTITY, loginModel.warehouse![0].leCode!);
          emit(state.copyWith(
              apiStatus: ApiStatus.success,
              loginModel: loginModel,
              message: "Login Successful"));
        }
        /*if (loginModel.warehouse![0].manualEntry != null) {
          SharedPreferencesHelper.saveBool(
              AppConstants.MANUAL_ENTRY_STATUS, loginModel.manualEntry!);
        }
        if(loginModel.error == null){
          emit(state.copyWith(
              apiStatus: ApiStatus.success,
              loginModel: loginModel,
              message: "Login Successful"));
        }else{
          emit(state.copyWith(
              apiStatus: ApiStatus.error,
              loginModel: loginModel,
              //message: loginModel.messages));
          message: loginModel.error));
        }*/
        emit(state.copyWith(apiStatus: ApiStatus.initial));
      },
    ).onError(
      (error, stackTrace) {
        debugPrint("LOGIN_ERROR===>$error");
        emit(state.copyWith(
            apiStatus: ApiStatus.error, message: error.toString()));
        emit(state.copyWith(apiStatus: ApiStatus.initial));
      },
    );
  }
}
