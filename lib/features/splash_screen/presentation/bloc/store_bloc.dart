import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../data/model/store_model.dart';
import '../../data/repository/store_repository.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  var storeRepository = StoreRepository();

  StoreBloc(this.storeRepository) : super(StoreLoading()) {
    on<FetchStoreEvent>(_fetchStoreList);
  }


  FutureOr<void> _fetchStoreList(FetchStoreEvent event, Emitter<StoreState> emit) async{
    emit(StoreLoading());
    await storeRepository.fetchStore().then((value) {
      if(kDebugMode){
        print("StoreList--->$value");
      }
      emit(StoreLoaded(StoreModel.fromJson(value)));
    },).onError((error, stackTrace) {
      if(kDebugMode){
        print("StoreListERROR--->$error");
      }
      emit(StoreError('$error'));
    },);
  }
}
