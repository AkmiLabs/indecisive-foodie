import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indecisivefoodie/components/custom_button.dart';
import 'package:indecisivefoodie/components/small_header.dart';
import 'package:indecisivefoodie/screens/food/components/back_nav.dart';
import 'package:line_icons/line_icons.dart';

class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackNav(),
              SmallHeader(heading1: "Indecisive", heading2: "Foodie"),
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/store");
                    },
                    child: Image.asset(
                      'assets/images/ramen.png',
                    )),
              )),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    "Malatang",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                        label: "See Stores Nearby",
                        backgroundColor: Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                        label: "I'm not feeling it",
                        backgroundColor: Colors.black),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
