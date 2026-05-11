part of 'legal_entity_bloc.dart';

class LegalEntityState extends Equatable {
  final ApiStatus? apiStatus;
  final String? message;
  final List<WarehouseData>? warehousesList;

  const LegalEntityState({this.apiStatus, this.message, this.warehousesList});

  LegalEntityState copyWith(
      {ApiStatus? apiStatus, String? message, List<WarehouseData>? warehousesList}) {
    return LegalEntityState(
      apiStatus: this.apiStatus ?? apiStatus,
      message: this.message ?? message,
      warehousesList: this.warehousesList ?? warehousesList,
    );
  }

  @override
  List<Object?> get props => [apiStatus, message, warehousesList];
}
