import 'package:flutter/material.dart';
import 'package:indecisivefoodie/models/resturants.dart';
import 'package:indecisivefoodie/screens/all_nearby_stores/all_nearby_stores_screen.dart';
import 'package:indecisivefoodie/screens/food/food.dart';
import 'package:indecisivefoodie/screens/screen_controller.dart';
import 'package:indecisivefoodie/screens/store_profile/store_profile_screen.dart';
import 'package:indecisivefoodie/services/resturants_api.dart';
import 'package:provider/provider.dart';

import 'models/geopoint.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider<Data>(
    create: (context) => Data(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Resturants> nearbyResturants = <Resturants>[];
  @override
  void initState() {
    super.initState();
    this.getData();
  }

  void getData() async {
    List<Resturants> resturants = [];
    print("object");

    resturants = await ResturantsApi.instance.getNearby(
        keyword: "Fried Chicken",
        radius: 1000,
        type: "restaurant",
        userLocation: GeoPoint(-33.93028868762633, 151.14944273336636));
    nearbyResturants = resturants;
    print(nearbyResturants[0].businessStatus);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Indecisive Foodie',
      theme: ThemeData(
          scaffoldBackgroundColor: Provider.of<Data>(context).backgroundColor,
          primarySwatch: Colors.blue,
          iconTheme: IconThemeData(color: Colors.black)),
      initialRoute: '/',
      routes: {
        '/': (context) => ScreenController(),
        '/food': (context) => FoodScreen(),
        '/store': (context) => StoreProfileScreen(),
        '/allstores': (context) =>
            AllNearbyStoresScreen(nearbyResturants: nearbyResturants),
      },
    );
  }
}
//Color(0xFFF2C94C)

class Data extends ChangeNotifier {
  Color backgroundColor = Colors.yellow;
  double searchRadius = 1000.0;

  void changeBackgroundColor(Color color) {
    backgroundColor = color;
    notifyListeners();
  }

  void changeSearchRadius(double radius) {
    searchRadius = radius;
    notifyListeners();
  }
}
