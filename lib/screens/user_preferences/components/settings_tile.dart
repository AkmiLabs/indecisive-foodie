import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final Function onTap;
  final String label;
  final IconData icon;
  final Color color;

  const SettingsTile({Key key, this.onTap, this.label, this.icon, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 8,
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 3),
              )
            ]),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(
        label,
        style: TextStyle(letterSpacing: 0.7, fontWeight: FontWeight.w600),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
      ),
      onTap: onTap,
    );
  }
}
