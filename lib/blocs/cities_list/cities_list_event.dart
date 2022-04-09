part of 'cities_list_bloc.dart';

abstract class CitiesListEvent extends Equatable {
  const CitiesListEvent();

  @override
  List<Object> get props => [];
}

class AddCityEvent extends CitiesListEvent {
  final String newCityName;
  const AddCityEvent({
    required this.newCityName,
  });

  @override
  String toString() => 'AddCityEvent(newCityName: $newCityName)';

  @override
  List<Object> get props => [newCityName];
}

class EditCityEvent extends CitiesListEvent {
  final String id;
  final String newCityname;

  const EditCityEvent({
    required this.id,
    required this.newCityname,
  });

  @override
  String toString() => 'EditCityEvent(id: $id, newCityname: $newCityname)';

  @override
  List<Object> get props => [id, newCityname];
}

class ToggleCityEvent extends CitiesListEvent {
  final String id;
  const ToggleCityEvent({
    required this.id,
  });

  @override
  String toString() => 'ToggleCityEvent(id: $id)';

  @override
  List<Object> get props => [id];
}

class RemoveCityEvent extends CitiesListEvent {
  final City city;
  const RemoveCityEvent({
    required this.city,
  });

  @override
  String toString() => 'RemoveCityEvent(city: $city)';

  @override
  List<Object> get props => [city];
}
