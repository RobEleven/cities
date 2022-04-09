part of 'filtered_cities_bloc.dart';

class FilteredCitiesState extends Equatable {
  final List<City> filteredCities;
  const FilteredCitiesState({
    required this.filteredCities,
  });

  factory FilteredCitiesState.initial() {
    return const FilteredCitiesState(filteredCities: []);
  }

  @override
  List<Object> get props => [filteredCities];

  @override
  String toString() => 'FilteredCitiesState(filteredCities: $filteredCities)';

  FilteredCitiesState copyWith({
    List<City>? filteredCities,
  }) {
    return FilteredCitiesState(
      filteredCities: filteredCities ?? this.filteredCities,
    );
  }
}
