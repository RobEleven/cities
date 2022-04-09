part of 'filtered_cities_bloc.dart';

abstract class FilteredCitiesEvent extends Equatable {
  const FilteredCitiesEvent();

  @override
  List<Object> get props => [];
}

class CalculateFilteredCitiesEvent extends FilteredCitiesEvent {
  final List<City> filteredCities;
  const CalculateFilteredCitiesEvent({
    required this.filteredCities,
  });

  @override
  String toString() =>
      'CalculateFilteredCitiesEvent(filteredCities: $filteredCities)';

  @override
  List<Object> get props => [filteredCities];
}
