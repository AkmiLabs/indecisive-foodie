import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class BackNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            width: 45,
            height: 45,
            child: IconButton(
                icon: Icon(
                  LineIcons.arrowLeft,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.black45)),
      ],
    );
  }
}
