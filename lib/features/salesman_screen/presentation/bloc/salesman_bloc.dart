import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/api_status.dart';
import '../../data/model/salesman_model.dart';
import '../../data/repository/salesman_repository.dart';

part 'salesman_event.dart';
part 'salesman_state.dart';

class SalesmanBloc extends Bloc<SalesmanEvent, SalesmanState> {

  var salesmanRepository = SalesmanRepository();

  SalesmanBloc(this.salesmanRepository) : super(const SalesmanState()) {
    on<FetchSalesmanList>(_fetchSalesmanList);
  }

  FutureOr<void> _fetchSalesmanList(FetchSalesmanList event, Emitter<SalesmanState> emit)  async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));
    await salesmanRepository.getSalesmanList().then(
          (value) {
        debugPrint("Salesman_VALUE==>$value");
        emit(state.copyWith(
            apiStatus: ApiStatus.success,
            salesmanModel: SalesmanModel.fromJson(value)));
      },
    ).onError(
          (error, stackTrace) {
        emit(state.copyWith(
            apiStatus: ApiStatus.error, message: "Getting some errors"));
      },
    );
  }
}
