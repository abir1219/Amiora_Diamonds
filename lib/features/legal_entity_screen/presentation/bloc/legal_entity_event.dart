part of 'legal_entity_bloc.dart';

sealed class LegalEntityEvent extends Equatable {
  const LegalEntityEvent();
}

final class ChangeLeCodeEvent extends LegalEntityEvent {
  final String lecode;

  const ChangeLeCodeEvent(this.lecode);

  @override
  List<Object?> get props => [lecode];
}

final class ClearStateEvent extends LegalEntityEvent{
  @override
  List<Object?> get props =>[];

}
