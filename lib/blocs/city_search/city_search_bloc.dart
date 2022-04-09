import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'city_search_event.dart';
part 'city_search_state.dart';

class CitySearchBloc extends Bloc<CitySearchEvent, CitySearchState> {
  CitySearchBloc() : super(CitySearchState.initial()) {
    on<SetSearchTermEvent>((event, emit) {
      emit(state.copyWith(searchTerm: event.newSearchTerm));
    }, transformer: debounce(const Duration(milliseconds: 2000)));
  }

  EventTransformer<SetSearchTermEvent> debounce<SetSearchTermEvent>(
      Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
