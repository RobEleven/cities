import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:cities/models/city_model.dart';

part 'city_filter_event.dart';
part 'city_filter_state.dart';

class CityFilterBloc extends Bloc<CityFilterEvent, CityStatusState> {
  CityFilterBloc() : super(CityStatusState.initial()) {
    on<ChangeFilterEvent>((event, emit) {
      emit(state.copyWith(cityStatus: event.newStatus));
    });
  }
}
