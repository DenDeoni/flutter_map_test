import 'dart:async';
import 'package:geolocator/geolocator.dart';

class GetLocation {
  Future<Position> getLocation() async {
    bool _serviceEnabled;
    var _permissionGranted = await Geolocator.checkPermission();
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (_permissionGranted == LocationPermission.denied || !_serviceEnabled) {
      _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    }
    return await Geolocator.getCurrentPosition();
  }
}
