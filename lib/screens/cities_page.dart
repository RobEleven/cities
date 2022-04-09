import 'package:flutter/material.dart';

import 'create_city.dart';
import 'search_and_filter_city.dart';
import 'show_cities.dart';
import 'cities_header.dart';

class CitiesPage extends StatelessWidget {
  const CitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/shooting_star.gif"),
            fit: BoxFit.cover,
          )),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 40.0,
              ),
              child: Column(
                children: const [
                  CityHeader(),
                  SizedBox(height: 20.0),
                  CreateCity(),
                  SizedBox(height: 20.0),
                  SearchAndFilterCity(),
                  SizedBox(height: 20.0),
                  ShowCities(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
