import "package:flutter/material.dart";

class CustomButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Function onPressed;
  const CustomButton({
    this.label,
    this.backgroundColor,
    this.onPressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                //side: BorderSide(color: Colors.black, width: 2),
              )),
              elevation: MaterialStateProperty.all(3),
              backgroundColor:
                  MaterialStateProperty.all<Color>(backgroundColor)),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Text(
              label,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          )),
    );
  }
}
