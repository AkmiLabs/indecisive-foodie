import 'package:flutter/material.dart';

class SmallHeader extends StatelessWidget {
  final String heading1;
  final String heading2;

  const SmallHeader({Key key, this.heading1, this.heading2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heading1.length != 0
              ? Text(
                  heading1,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontFamily: "Barriecito-Regular"),
                )
              : Container(),
          Text(
            heading2,
            style: TextStyle(
                height: 1,
                fontSize: 68,
                color: Colors.black,
                fontFamily: "Barriecito-Regular"),
          )
        ],
      ),
    );
  }
}
