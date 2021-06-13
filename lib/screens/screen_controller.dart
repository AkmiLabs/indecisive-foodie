import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indecisivefoodie/screens/fav/fav_screen.dart';
import 'package:indecisivefoodie/screens/home/home_screen.dart';
import 'package:indecisivefoodie/screens/user_preferences/user_pref_screen.dart';

import '../components/bottom_nav_bar.dart';

class ScreenController extends StatefulWidget {
  @override
  _ScreenControllerState createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  PageController controller = PageController(initialPage: 1);
  //final themeProvider = Provider.of<ThemeProvider>(context);
  int _index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: PageView(
          controller: controller,
          onPageChanged: (page) {
            _index = page;
            setState(() {
              controller.animateToPage(page,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInExpo);
            });
          },
          children: <Widget>[
            FavScreen(),
            HomeScreen(
              infoCallback: () {
                setState(() {
                  controller.animateToPage(2,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInExpo);
                });
              },
            ),
            UserPrefScreen()
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          controller: controller,
          pageIndex: _index,
        ));
  }
}
