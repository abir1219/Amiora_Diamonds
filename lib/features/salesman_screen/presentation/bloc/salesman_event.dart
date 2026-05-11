part of 'salesman_bloc.dart';

sealed class SalesmanEvent extends Equatable {
  const SalesmanEvent();
}

final class FetchSalesmanList extends SalesmanEvent{
  @override
  List<Object?> get props => [];

}
