import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Text(
        "Indecisive\nFoodie",
        style: TextStyle(
            height: 1,
            fontSize: 68,
            color: Colors.black,
            fontFamily: "Barriecito-Regular"),
      ),
    );
  }
}
