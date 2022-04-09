// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import 'package:cities/models/city_model.dart';

class SearchAndFilterCity extends StatelessWidget {
  const SearchAndFilterCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                labelText: 'Search city',
                fillColor: Colors.amber,
                filled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              onChanged: (String? newSearchTerm) {
                if (newSearchTerm != null) {
                  context
                      .read<CitySearchBloc>()
                      .add(SetSearchTermEvent(newSearchTerm: newSearchTerm));
                }
              }),
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            filterButton(context, CityStatus.planned),
            filterButton(context, CityStatus.visited),
          ],
        ),
      ],
    );
  }

  Widget filterButton(BuildContext context, CityStatus cityStatus) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.black),
        color: Colors.amber,
      ),
      child: TextButton(
        style: ButtonStyle(
            overlayColor:
                MaterialStateColor.resolveWith((states) => Colors.grey),
            padding:
                MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ))),
        onPressed: () {
          context
              .read<CityFilterBloc>()
              .add(ChangeFilterEvent(newStatus: cityStatus));
        },
        child: Text(
          cityStatus == CityStatus.all
              ? 'All'
              : cityStatus == CityStatus.planned
                  ? 'Planned:'
                  : 'Visited:',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
