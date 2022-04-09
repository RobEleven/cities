import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

import '../../blocs/blocs.dart';

class CreateCity extends StatefulWidget {
  const CreateCity({Key? key}) : super(key: key);

  @override
  State<CreateCity> createState() => _CreateCityState();
}

class _CreateCityState extends State<CreateCity> {
  final TextEditingController newCityController = TextEditingController();

  @override
  void dispose() {
    newCityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
          style: const TextStyle(
            color: Colors.black,
          ),
          controller: newCityController,
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            labelText: 'New city to visit is..',
            fillColor: Colors.amber,
            filled: true,
            prefixIcon: const Icon(
              Icons.location_city,
              color: Colors.black,
            ),
          ),
          onSubmitted: (String? cityName) {
            showPlatformDialog(
              context: context,
              builder: (context) => BasicDialogAlert(
                title: const Text(
                  "Perfect!",
                  textAlign: TextAlign.center,
                ),
                content: const Text("You prepared another city to visit!"),
                actions: [
                  BasicDialogAction(
                    title: const Text("Confirm"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
            if (cityName != null && cityName.trim().isNotEmpty) {
              context
                  .read<CitiesListBloc>()
                  .add(AddCityEvent(newCityName: cityName));
              newCityController.clear();
            }
          }),
    );
  }
}
