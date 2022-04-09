import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';

import 'screens/cities_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CityFilterBloc>(
          create: (context) => CityFilterBloc(),
        ),
        BlocProvider<CitySearchBloc>(
          create: (context) => CitySearchBloc(),
        ),
        BlocProvider<CitiesListBloc>(
          create: (context) => CitiesListBloc(),
        ),
        BlocProvider<FilteredCitiesBloc>(
          create: (context) => FilteredCitiesBloc(
            initialCity: context.read<CitiesListBloc>().state.cities,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Cities',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CitiesPage(),
      ),
    );
  }
}
