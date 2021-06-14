import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  DialogBox({this.header, this.body, this.button});
  final String header;
  final String body;
  final Widget button;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(header),
      content: Text(body),
      actions: <Widget>[
        button,
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
