import 'package:flutter/material.dart';
import 'package:indecisivefoodie/main.dart';
import 'package:provider/provider.dart';

class MinRatingDialogBox extends StatefulWidget {
  @override
  _MinRatingDialogBoxState createState() => _MinRatingDialogBoxState();
}

class _MinRatingDialogBoxState extends State<MinRatingDialogBox> {
  void changeColor(Color color) {
    // setState(() => pickerColor = color);
  }
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      title: new Text("Minimum Rating"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Slider(
            value: _currentSliderValue,
            min: 0,
            max: 5,
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
