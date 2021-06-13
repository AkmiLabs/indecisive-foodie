import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'dart:io';
import 'package:line_icons/line_icons.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({
    @required this.pageIndex,
    @required this.controller,
  });
  int pageIndex;
  final PageController controller;
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Platform.isIOS
          ? EdgeInsets.symmetric(horizontal: 12, vertical: 12)
          : EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              spreadRadius: -10,
              blurRadius: 60,
              color: Colors.black.withOpacity(0.4),
              offset: Offset(0, 25),
            )
          ]),
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        iconSize: 28,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInCubic,
        haptic: false,
        gap: 0,
        tabs: [
          GButton(
            icon: LineIcons.heartAlt,
            iconColor: Colors.red[200],
            iconActiveColor: Colors.red,
          ),
          GButton(
            icon: Icons.home,
            iconColor: Colors.black26,
            iconActiveColor: Colors.black,
          ),
          GButton(
              icon: Icons.person_search_rounded,
              iconColor: Colors.blue[200],
              iconActiveColor: Colors.blue),
        ],
        selectedIndex: widget.pageIndex,
        onTabChange: (index) {
          setState(() {
            widget.pageIndex = index;
            widget.controller.animateToPage(index,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInExpo);
          });
        },
      ),
    );
  }
}
