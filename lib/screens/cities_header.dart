import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CityHeader extends StatelessWidget {
  const CityHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Cities',
      style: GoogleFonts.caveat(
          textStyle: const TextStyle(
        color: Colors.amber,
        fontSize: 85,
      )),
    );
  }
}
