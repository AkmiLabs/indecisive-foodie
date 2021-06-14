import 'package:flutter/material.dart';
import 'package:indecisivefoodie/components/custom_button.dart';
import 'package:indecisivefoodie/models/geopoint.dart';
import 'package:indecisivefoodie/services/api_key.dart';
import 'package:indecisivefoodie/screens/home/components/header.dart';
import 'package:indecisivefoodie/screens/home/components/sub_heading.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_place/google_place.dart';
import 'dart:developer';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.infoCallback}) : super(key: key);
  final Function infoCallback;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animController;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      reverseDuration: Duration(milliseconds: 700),
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    animation = Tween<double>(
      begin: 1,
      end: 1.05,
    ).animate(animController)
      ..addListener(() {
        // Empty setState because the updated value is already in the animation field
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animController.forward();
        }
      });

    animController.forward();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            SubHeading(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Transform.scale(
                    scale: animation.value,
                    child: TextButton(
                        onPressed: () async {
                          // var googlePlace = GooglePlace(API.key);

                          // Navigator.pushNamed(context, "/food");
                          // var result = await googlePlace.search.getNearBySearch(
                          //     Location(lat: -33.8670522, lng: 151.1957362), 1500,
                          //     type: "restaurant", keyword: "cruise");
                        },
                        child: Image.asset(
                          'assets/images/food.png',
                          width: 260,
                        )),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      label: "All Stores Nearby",
                      backgroundColor: Colors.red,
                      onPressed: () {
                        Navigator.pushNamed(context, "/allstores");
                      },
                    ),
                    CustomButton(
                      label: "Preferences",
                      backgroundColor: Colors.black,
                      onPressed: widget.infoCallback,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
