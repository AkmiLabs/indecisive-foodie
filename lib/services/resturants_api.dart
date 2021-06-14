import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_key.dart';
import '../models/geopoint.dart';
import '../models/resturants.dart';

class ResturantsApi {
  static ResturantsApi _instance;

  ResturantsApi._();

  static ResturantsApi get instance {
    if (_instance == null) {
      _instance = ResturantsApi._();
    }
    return _instance;
  }

  Future<List<Resturants>> getNearby(
      {GeoPoint userLocation,
      double radius,
      String type,
      String keyword}) async {
    String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${userLocation.latitude},${userLocation.longitude}&radius=$radius&type=$type&keyword=$keyword&key=${API.key}';
    http.Response response = await http.get(Uri.parse(url));
    final values = jsonDecode(response.body);
    final List result = values['results'];
    return result.map((e) => Resturants.fromJson(e)).toList();
  }
}
