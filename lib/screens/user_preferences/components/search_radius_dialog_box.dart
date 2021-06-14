import 'package:flutter/material.dart';
import 'package:indecisivefoodie/main.dart';
import 'package:provider/provider.dart';

class SearchRadiusDialogBox extends StatefulWidget {
  @override
  _SearchRadiusDialogBoxState createState() => _SearchRadiusDialogBoxState();
}

class _SearchRadiusDialogBoxState extends State<SearchRadiusDialogBox> {
  void changeColor(Color color) {
    // setState(() => pickerColor = color);
  }
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      title: new Text("Search Radius (Km)"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Slider(
            value: _currentSliderValue,
            min: 0,
            max: 100,
            divisions: 5,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
