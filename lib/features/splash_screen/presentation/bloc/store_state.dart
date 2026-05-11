part of 'store_bloc.dart';

sealed class StoreState extends Equatable {
  const StoreState();
}

final class StoreInitial extends StoreState {
  @override
  List<Object> get props => [];
}

final class StoreLoading extends StoreState{
  @override
  List<Object?> get props => [];
}

final class StoreLoaded extends StoreState{
  final StoreModel? storeModel;
  const StoreLoaded(this.storeModel);

  @override
  List<Object?> get props => [storeModel];
}

final class StoreError extends StoreState{
  final String? errorMsg;
  const StoreError(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}
