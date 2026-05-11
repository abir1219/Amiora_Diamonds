import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/constants/api_status.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/local/shared_preferences_helper.dart';
import '../../data/model/warehouse_model.dart';
import '../../data/repository/WarehouseRepository.dart';

part 'legal_entity_event.dart';
part 'legal_entity_state.dart';

class LegalEntityBloc extends Bloc<LegalEntityEvent, LegalEntityState> {
  final WarehouseRepository _warehouseRepository;

  LegalEntityBloc(this._warehouseRepository) : super(LegalEntityState()) {
    on<ChangeLeCodeEvent>(_onChangeLeCode);
    on<ClearStateEvent>(_clearState);
  }

  Future<void> _clearState(ClearStateEvent event,Emitter<LegalEntityState> emit)async{
    emit(const LegalEntityState());
  }

  FutureOr<void> _onChangeLeCode(
      ChangeLeCodeEvent event, Emitter<LegalEntityState> emit) async{

    //await SharedPreferencesHelper.init();

    String username = SharedPreferencesHelper.getString(AppConstants.USER_NAME)!;
    String lecode = event.lecode;//SharedPreferencesHelper.getString(AppConstants.LEGAL_ENTITY)!;

    Map<String,dynamic> body = {
      "username" : username,
      "le_code" : lecode,
    };

    await _warehouseRepository.getWarehouseList(body).then((value) {
      final warehouseModel = WarehouseModel.fromJson(value);
      debugPrint("WAREHOUSE_LIST-->${warehouseModel.warehouseList}");
      emit(
        state.copyWith(
          apiStatus: ApiStatus.success,warehousesList: warehouseModel.warehouseList,
        ),);

    },).onError((error, stackTrace) {
      debugPrint("WAREHOUSE_LIST_ERROR-->$error");
      emit(
        state.copyWith(
          apiStatus: ApiStatus.error,message: "Getting something errors",
        ),);
    },);
    emit(
      state.copyWith(
          apiStatus: ApiStatus.loading,),);
    //emit(state.copyWith(stateName: ))
  }


}
