import 'dart:convert';
import 'package:dactyl_test_app/models/restaurant_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class RestaurantsDataProvider {
  static const _url = 'https://cms.dgrp.cz/ios/data.json';

  late List<RestaurantModel> _loadedData;
  late List<RestaurantModel> restaurants;

  //var dio = Dio();

  Future<List<RestaurantModel>> _loadDataFromNetwork() async {
    var response = await http.get(Uri.parse(_url));
    //await dio.get(_url);
    var dataParsed = json.decode(response.body)["restaurants"];
    //json.decode(response.data["restaurants"],);
    restaurants = await dataParsed
        .map<RestaurantModel>(
          (e) => RestaurantModel.fromJson(e),
        )
        .toList();
    return restaurants;
  }

  Future<bool> _getData() async {
    _loadedData = await _loadDataFromNetwork();
    return true;
  }

  Future<List<RestaurantModel>> getData() async {
    await _getData();
    final calculatedData = List<RestaurantModel>.from(_loadedData, growable: false);
    return calculatedData.map((e) => e).toList(growable: false);
  }
}
