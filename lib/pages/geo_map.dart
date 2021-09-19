import 'package:dactyl_test_app/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:dactyl_test_app/utils/consts.dart';
import 'package:dactyl_test_app/utils/get_location.dart';
import 'package:dactyl_test_app/widgets/place.dart';
import 'package:latlong2/latlong.dart';
import 'dart:ui';

class GeoMap extends StatefulWidget {
  static const routeName = GEO_MAP;

  @override
  _GeoMapState createState() => _GeoMapState();
}

class _GeoMapState extends State<GeoMap> {
  late double latitudeData;
  late double longitudeData;
  double latitudeCentral = 0.0;
  double longitudeCentral = 0.0;
  var _currentPosition;
  late MapController mapController;

  @override
  void initState() {
    _getLocation();
    mapController = MapController();
    super.initState();
  }

  void _getLocation() async {
    _currentPosition = await GetLocation().getLocation();
    setState(() {
      latitudeData = _currentPosition.latitude!;
      longitudeData = _currentPosition.longitude!;
    });
  }

  void _getCentralPointCoordinates() {
    setState(() {
      latitudeCentral = mapController.center.latitude;
      longitudeCentral = mapController.center.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                child: _currentPosition != null ? _flutterMap() : _progress(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _flutterMap() => FlutterMap(
        mapController: mapController,
        options: MapOptions(
          center: LatLng(latitudeData + 0.01, longitudeData + 0.001),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 500,
                height: 100,
                builder: (ctx) => place(context, "Your place"),
                point: LatLng(latitudeData, longitudeData),
              ),
            ],
          ),
        ],
      );

  Widget _progress() => Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      );
}
