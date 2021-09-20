import 'dart:convert';
import 'package:dactyl_test_app/models/restaurant_model.dart';
import 'package:http/http.dart' as http;

class RestDetailDataProvider {
  static const _url = 'https://cms.dgrp.cz/ios/data.json';

  late RestaurantModel _loadedData;
  late RestaurantModel _restDetail;

  Future<RestaurantModel> _loadData() async {
    final response = await http.get(
      Uri.parse(_url),
    );
    var dataParsed = json.decode(response.body);
    _restDetail = RestaurantModel.fromJson(dataParsed);
    return _restDetail;
  }

  Future<bool> _getData() async {
    _loadedData = await _loadData();
    return true;
  }

  Future<RestaurantModel> getData() async {
    await _getData();
    final calculatedData = _loadedData;
    return calculatedData;
  }
}
