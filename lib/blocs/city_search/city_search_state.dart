part of 'city_search_bloc.dart';

class CitySearchState extends Equatable {
  final String searchTerm;
  const CitySearchState({
    required this.searchTerm,
  });

  factory CitySearchState.initial() {
    return const CitySearchState(searchTerm: '');
  }

  @override
  List<Object> get props => [searchTerm];

  @override
  String toString() => 'CitiesSearchState(searchTerm: $searchTerm)';

  CitySearchState copyWith({
    String? searchTerm,
  }) {
    return CitySearchState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}
