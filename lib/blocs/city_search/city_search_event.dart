part of 'city_search_bloc.dart';

abstract class CitySearchEvent extends Equatable {
  const CitySearchEvent();

  @override
  List<Object> get props => [];
}

class SetSearchTermEvent extends CitySearchEvent {
  final String newSearchTerm;
  const SetSearchTermEvent({
    required this.newSearchTerm,
  });

  @override
  String toString() => 'SetSearchTermEvent(newSearchTerm: $newSearchTerm)';

  @override
  List<Object> get props => [newSearchTerm];
}
