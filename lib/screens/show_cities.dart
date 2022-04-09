import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

import 'package:cities/models/city_model.dart';
import '../../blocs/blocs.dart';

class ShowCities extends StatelessWidget {
  const ShowCities({Key? key}) : super(key: key);

  List<City> setCityStatus(
    CityStatus cityStatus,
    List<City> cities,
    String searchTerm,
  ) {
    List<City> _cityStatus;

    switch (cityStatus) {
      case CityStatus.visited:
        _cityStatus = cities.where((City city) => city.visited).toList();
        break;
      case CityStatus.all:
      default:
        _cityStatus = cities;
        break;
    }

    if (searchTerm.isNotEmpty) {
      _cityStatus = _cityStatus
          .where(
              (City city) => city.cityName.toLowerCase().contains(searchTerm))
          .toList();
    }

    return _cityStatus;
  }

  @override
  Widget build(BuildContext context) {
    final cities = context.watch<FilteredCitiesBloc>().state.filteredCities;

    return MultiBlocListener(
      listeners: [
        BlocListener<CitiesListBloc, CitiesListState>(
          listener: (context, state) {
            final filteredCities = setCityStatus(
              context.read<CityFilterBloc>().state.cityStatus,
              state.cities,
              context.read<CitySearchBloc>().state.searchTerm,
            );
            context.read<FilteredCitiesBloc>().add(
                CalculateFilteredCitiesEvent(filteredCities: filteredCities));
          },
        ),
        BlocListener<CityFilterBloc, CityStatusState>(
          listener: (context, state) {
            final filteredCities = setCityStatus(
              state.cityStatus,
              context.read<CitiesListBloc>().state.cities,
              context.read<CitySearchBloc>().state.searchTerm,
            );
            context.read<FilteredCitiesBloc>().add(
                CalculateFilteredCitiesEvent(filteredCities: filteredCities));
          },
        ),
        BlocListener<CitySearchBloc, CitySearchState>(
          listener: (context, state) {
            final filteredCities = setCityStatus(
              context.read<CityFilterBloc>().state.cityStatus,
              context.read<CitiesListBloc>().state.cities,
              state.searchTerm,
            );
            context.read<FilteredCitiesBloc>().add(
                CalculateFilteredCitiesEvent(filteredCities: filteredCities));
          },
        ),
      ],
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        itemCount: cities.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(color: Colors.amber);
        },
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ValueKey(cities[index].id),
            background: showBackground(0),
            secondaryBackground: showBackground(1),
            onDismissed: (_) {
              context
                  .read<CitiesListBloc>()
                  .add(RemoveCityEvent(city: cities[index]));
            },
            confirmDismiss: (_) {
              return showPlatformDialog(
                context: context,
                builder: (context) => BasicDialogAlert(
                  title: const Text("Hey! Are you sure?"),
                  content: const Text("Do you really want to delete the city?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('No'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Yes'),
                    ),
                  ],
                ),
              );

              /*
              return showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Hey! Are you sure?'),
                    content: const Text(
                        'Do you really want to delete the city you have been to?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('NO'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('YES'),
                      ),
                    ],
                  );
                },
              );

            */
            },
            child: CityItem(city: cities[index]),
          );
        },
      ),
    );
  }

  Widget showBackground(int direction) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.red,
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        size: 30.0,
        color: Colors.white,
      ),
    );
  }
}

class CityItem extends StatefulWidget {
  final City city;
  const CityItem({
    Key? key,
    required this.city,
  }) : super(key: key);

  @override
  _CityItemState createState() => _CityItemState();
}

class _CityItemState extends State<CityItem> {
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            bool _error = false;
            textController.text = widget.city.cityName;

            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return AlertDialog(
                  title: const Text(
                    'Edit the city',
                    textAlign: TextAlign.center,
                  ),
                  content: TextField(
                    controller: textController,
                    autofocus: true,
                    decoration: InputDecoration(
                      errorText: _error ? "Value cannot be empty" : null,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('CANCEL'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _error = textController.text.isEmpty ? true : false;
                          if (!_error) {
                            context.read<CitiesListBloc>().add(
                                  EditCityEvent(
                                    id: widget.city.id,
                                    newCityname: textController.text,
                                  ),
                                );
                            Navigator.pop(context);
                          }
                        });
                      },
                      child: const Text('EDIT'),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
      leading: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.amber,
        ),
        child: Checkbox(
          activeColor: Colors.amber,
          checkColor: Colors.black,
          value: widget.city.visited,
          onChanged: (bool? checked) {
            context
                .read<CitiesListBloc>()
                .add(ToggleCityEvent(id: widget.city.id));
          },
        ),
      ),
      title: Text(
        widget.city.cityName,
        style: const TextStyle(
          color: Colors.amber,
          fontSize: 22,
        ),
      ),
    );
  }
}
