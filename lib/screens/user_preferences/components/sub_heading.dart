import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubHeading extends StatelessWidget {
  SubHeading({this.heading});

  final String heading;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(16, 8, 16, 10),
      child: Text(
        heading,
        style: TextStyle(
            color: Colors.black54,
            letterSpacing: 0.7,
            fontSize: 14,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
