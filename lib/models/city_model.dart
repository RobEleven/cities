import "package:uuid/uuid.dart";
import 'package:equatable/equatable.dart';

enum CityStatus {
  all,
  planned,
  visited,
}

Uuid uuid = const Uuid();

class City extends Equatable {
  final String id;
  final String cityName;
  final bool visited;

  City({
    String? id, 
    required this.cityName, 
    this.visited = false,
  }) : id = id ?? uuid.v4();



  @override
  List<Object> get props => [id, cityName, visited];

  @override
  String toString() => 'City(id: $id, cityName: $cityName, visited: $visited)';
}
