import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:indecisivefoodie/main.dart';
import 'package:provider/provider.dart';

class BackgroundColorDialogBox extends StatefulWidget {
  @override
  _BackgroundColorDialogBoxState createState() =>
      _BackgroundColorDialogBoxState();
}

class _BackgroundColorDialogBoxState extends State<BackgroundColorDialogBox> {
  void changeColor(Color color) {
    // setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text("Change Background Color"),
      content: BlockPicker(
        pickerColor: Colors.black,
        onColorChanged: (color) {
          Provider.of<Data>(context, listen: false)
              .changeBackgroundColor(color);
        },
        availableColors: [
          Color(0xFFFFCD4D),
          Color(0xFF98D333),
          Color(0xFF20DEB0),
          Color(0xFFFF598F),
          Color(0xFF02AFB6),
          Colors.redAccent,
          Colors.orange
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
