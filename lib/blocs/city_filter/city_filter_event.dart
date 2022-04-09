part of 'city_filter_bloc.dart';

abstract class CityFilterEvent extends Equatable {
  const CityFilterEvent();

  @override
  List<Object> get props => [];
}

class ChangeFilterEvent extends CityFilterEvent {
  final CityStatus newStatus;
  const ChangeFilterEvent({
    required this.newStatus,
  });

  @override
  String toString() => 'ChangeFilterEvent(newFilter: $newStatus)';

  @override
  List<Object> get props => [newStatus];
}
