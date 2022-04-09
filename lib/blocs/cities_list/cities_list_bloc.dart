import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:cities/models/city_model.dart';

part 'cities_list_event.dart';
part 'cities_list_state.dart';

class CitiesListBloc extends Bloc<CitiesListEvent, CitiesListState> {
  CitiesListBloc() : super(CitiesListState.initial()) {
    on<AddCityEvent>(_addCity);
    on<EditCityEvent>(_editCity);
    on<ToggleCityEvent>(_toggleCity);
    on<RemoveCityEvent>(_removeCity);
  }

  void _addCity(AddCityEvent event, Emitter<CitiesListState> emit) {
    final newCity = City(cityName: event.newCityName);
    final newCities = [...state.cities, newCity];
 
    emit(state.copyWith(cities: newCities));
  }

  void _editCity(EditCityEvent event, Emitter<CitiesListState> emit) {
    final newCities = state.cities.map((City city) {
      if(city.id == event.id) {
        return City(
          id: event.id,
          cityName: event.newCityname,
          visited: city.visited,
        );
      }
      return city;
    }).toList();

    emit(state.copyWith(cities: newCities));
  }

  void _toggleCity(ToggleCityEvent event, Emitter<CitiesListState> emit) {
    final newCities = state.cities.map((City city) {
      if(city.id == event.id) {
        return City(
          id: event.id,
          cityName: city.cityName,
          visited: !city.visited,
        );
      }
      return city;
    }).toList();

    emit(state.copyWith(cities: newCities));
  }

  void _removeCity(RemoveCityEvent event, Emitter<CitiesListState> emit) {
    final newCities =
    state.cities.where((City c) => c.id != event.city.id).toList();

    emit(state.copyWith(cities: newCities));
  }
 
 
 
 
 
 
 
 
  
}