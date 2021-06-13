import 'package:flutter/material.dart';
import 'package:indecisivefoodie/components/small_header.dart';
import 'package:indecisivefoodie/screens/user_preferences/components/sub_heading.dart';
import 'package:indecisivefoodie/screens/user_preferences/components/settings_tile.dart';
import 'package:line_icons/line_icons.dart';

class UserPrefScreen extends StatelessWidget {
  final TextStyle whiteText = TextStyle(
    color: Colors.white,
  );
  final TextStyle greyTExt = TextStyle(
    color: Colors.grey.shade400,
  );
  final TextStyle whiteBoldText = TextStyle(fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallHeader(
                heading1: "My Foodie",
                heading2: "Preferences",
              ),
              SizedBox(height: 30),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: -5,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, 25),
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubHeading(heading: "Search Options"),
                      SettingsTile(
                        icon: Icons.map_sharp,
                        label: "Search Radius",
                        onTap: () {},
                        color: Color(0xff8930CF),
                      ),
                      SettingsTile(
                        icon: Icons.attach_money,
                        label: "Maximum Price Range",
                        onTap: () {},
                        color: Color(0xff20DEB0),
                      ),
                      Divider(),
                      SubHeading(heading: "App Settings"),
                      SettingsTile(
                        icon: Icons.color_lens,
                        label: "Background Color",
                        onTap: () {},
                        color: Color(0xFF474DFF),
                      ),
                      Divider(),
                      SubHeading(heading: "Misc"),
                      SettingsTile(
                        icon: Icons.share,
                        label: "Share with friends",
                        onTap: () {},
                        color: Color(0xffC55A42),
                      ),
                      SettingsTile(
                        icon: Icons.info_outline,
                        label: "About Indecisive Foodie",
                        onTap: () {},
                        color: Color(0xff98D333),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
