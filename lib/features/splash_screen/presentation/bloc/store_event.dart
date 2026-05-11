part of 'store_bloc.dart';

sealed class StoreEvent extends Equatable {
  const StoreEvent();
}

final class FetchStoreEvent extends StoreEvent{
  @override
  List<Object?> get props => [];

}
