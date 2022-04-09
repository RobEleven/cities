import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:cities/models/city_model.dart';

part 'filtered_cities_event.dart';
part 'filtered_cities_state.dart';

class FilteredCitiesBloc extends Bloc<FilteredCitiesEvent, FilteredCitiesState> {
  final List<City> initialCity;

  FilteredCitiesBloc({
    required this.initialCity,
  }) : super(FilteredCitiesState(filteredCities: initialCity)) {
    on<CalculateFilteredCitiesEvent>((event, emit) {
     emit(state.copyWith(filteredCities: event.filteredCities));
    });
  }
}
