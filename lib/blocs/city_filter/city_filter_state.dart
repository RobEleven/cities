part of 'city_filter_bloc.dart';

class CityStatusState extends Equatable {
  final CityStatus cityStatus;
  const CityStatusState({
    required this.cityStatus,
  });

  factory CityStatusState.initial() {
    return const CityStatusState(cityStatus: CityStatus.planned);
  }

  @override
  List<Object> get props => [cityStatus];

  @override
  String toString() => 'CityFilterState(filter: $cityStatus)';

  CityStatusState copyWith({
    CityStatus? cityStatus,
  }) {
    return CityStatusState(
      cityStatus: cityStatus ?? this.cityStatus,
    );
  }
}
