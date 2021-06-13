import 'package:flutter/material.dart';
import 'package:indecisivefoodie/screens/food/food.dart';
import 'package:indecisivefoodie/screens/screen_controller.dart';
import 'package:indecisivefoodie/screens/store/store_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Indecisive Foodie',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.yellow,
          primarySwatch: Colors.blue,
          iconTheme: IconThemeData(color: Colors.black)),
      initialRoute: '/',
      routes: {
        '/': (context) => ScreenController(),
        '/food': (context) => FoodScreen(),
        '/store': (context) => StoreScreen(),
      },
    );
  }
}
//Color(0xFFF2C94C)