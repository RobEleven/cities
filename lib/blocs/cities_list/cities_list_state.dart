part of 'cities_list_bloc.dart';

class CitiesListState extends Equatable {
  final List<City> cities;
  const CitiesListState({
    required this.cities,
  });

  factory CitiesListState.initial() {
    return CitiesListState(cities: [
      City(id: '1', cityName: 'City of your birth (EDIT)'),
    ]);
  }

  @override
  List<Object> get props => [cities];

  @override
  String toString() => 'CitiesListState(cities: $cities)';

  CitiesListState copyWith({
    List<City>? cities,
  }) {
    return CitiesListState(
      cities: cities ?? this.cities,
    );
  }
}
