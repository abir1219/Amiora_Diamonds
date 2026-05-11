import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/api_status.dart';
import '../../data/repository/update_password_repository.dart';

part 'update_password_event.dart';
part 'update_password_state.dart';

class UpdatePasswordBloc extends Bloc<UpdatePasswordEvent, UpdatePasswordState> {
  var updatePasswordRepository = UpdatePasswordRepository();


  UpdatePasswordBloc(this.updatePasswordRepository) : super(const UpdatePasswordState()) {
    on<UpdatePassword>(_updatePassword);
    on<PasswordVisibilityChangeEvent>(_passwordVisibility);
    on<ConfirmPasswordVisibilityChangeEvent>(_cnfrmPasswordVisibility);
  }

  FutureOr<void> _passwordVisibility(
      PasswordVisibilityChangeEvent event, Emitter<UpdatePasswordState> emit) {
    debugPrint("state.isPwVisible==>${state.isPwVisible}");
    // emit(state.copyWith(isPwVisible: state.isPwVisible == false ? true : false));
    emit(state.copyWith(isPwVisible: !state.isPwVisible!));
    debugPrint("state.isPwVisible_NEW==>${state.isPwVisible}");
  }

  FutureOr<void> _cnfrmPasswordVisibility(
      ConfirmPasswordVisibilityChangeEvent event, Emitter<UpdatePasswordState> emit) {
    emit(state.copyWith(isCnPwVisible: state.isCnPwVisible == true ? false : true));
  }

  FutureOr<void> _updatePassword(UpdatePassword event,Emitter<UpdatePasswordState> emit) async{
    emit(state.copyWith(apiStatus: ApiStatus.loading));

    Map<String,dynamic> body = {
      "username" : event.username,
      "password" : event.password,
    };
    await updatePasswordRepository.updatePasswordApi(body).then((value) {
      emit(state.copyWith(apiStatus: ApiStatus.success,message: "Password update successfully."));
    },).onError((error, stackTrace) {
      emit(state.copyWith(apiStatus: ApiStatus.error,message: "Getting some errors."));
    },);
  }
}
