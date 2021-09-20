import 'dart:convert';
import 'package:dactyl_test_app/models/restaurant_model.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class RestaurantsDataProvider {
  static const _url = 'https://cms.dgrp.cz/ios/data.json';
  late List<RestaurantModel> _loadedData;
  late List<RestaurantModel> restaurants;

  //var dio = Dio();

  Future<List<RestaurantModel>> _loadDataFromNetwork(double currentLat, double currentLon) async {
    var response = await http.get(Uri.parse(_url));
    //await dio.get(_url);
    var dataParsed = json.decode(response.body)["restaurants"];
    //json.decode(response.data["restaurants"],);
    restaurants = await dataParsed
        .map<RestaurantModel>(
          (e) => RestaurantModel.fromJson(e),
        )
        .toList();
    restaurants.sort((a, b) => (Geolocator.distanceBetween(
            double.parse(a.restaurant.location.latitude),
            double.parse(a.restaurant.location.longitude),
            currentLat,
            currentLon)
        .compareTo(Geolocator.distanceBetween(double.parse(b.restaurant.location.latitude),
            double.parse(b.restaurant.location.longitude), currentLat, currentLon))));
    return restaurants;
  }

  Future<bool> _getData(double currentLatitude, double currentLongitude) async {
    _loadedData = await _loadDataFromNetwork(currentLatitude, currentLongitude);
    return true;
  }

  Future<List<RestaurantModel>> getData(double currentLatitude, double currentLongitude) async {
    await _getData(currentLatitude, currentLongitude);
    final calculatedData = List<RestaurantModel>.from(_loadedData, growable: false);
    return calculatedData.map((e) => e).toList(growable: false);
  }
}
