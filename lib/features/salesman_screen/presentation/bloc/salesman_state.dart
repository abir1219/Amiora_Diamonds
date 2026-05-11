part of 'salesman_bloc.dart';

class SalesmanState extends Equatable {
  final String? message;
  final ApiStatus? apiStatus;
  final SalesmanModel? salesmanModel;

  const SalesmanState({this.message, this.apiStatus, this.salesmanModel});

  SalesmanState copyWith(
      {String? message, ApiStatus? apiStatus, SalesmanModel? salesmanModel}) {
    return SalesmanState(
        message: message ?? this.message,
        apiStatus: apiStatus ?? this.apiStatus,
        salesmanModel: salesmanModel ?? this.salesmanModel);
  }

  @override
  List<Object?> get props => [message, apiStatus, salesmanModel];
}
