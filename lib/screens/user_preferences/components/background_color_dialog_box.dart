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
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      title: new Text("Background Color"),
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
          Colors.orange,
          Color(0xff31C133),
          Color(0xffF7BAC5),
          Color(0xffF7ECDF),
          Color(0xffE4D1F1),
          Color(0xffF7F494),
          Color(0xff01A6E4),
          Color(0xffD5B3B1),
          Color(0xff3FE7E8),
          Color(0xff558CCC),
          Color(0xff8500F7),
          Color(0xff14F700),
          Color(0xffF700EC),
          Color(0xffF7F7F7),
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
