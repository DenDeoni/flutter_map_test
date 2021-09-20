import 'package:dactyl_test_app/bloc/restaurants/restaurants_state.dart';
import 'package:dactyl_test_app/bloc/restaurants/restaurants_bloc.dart';
import 'package:dactyl_test_app/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              BlocBuilder<RestaurantsBloc, MainState>(
                builder: (context, state) {
                  return Container(
                    child:
                        _currentPosition != null ? _flutterMap(state.restaurantsList) : _progress(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _flutterMap(restaurantModel) => FlutterMap(
        mapController: mapController,
        options: MapOptions(
          center: LatLng(latitudeData + 0.01, longitudeData + 0.001),
          zoom: 2.0,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          MarkerLayerOptions(
            markers: [
              Marker(
                rotate: true,
                width: 500,
                height: 100,
                builder: (ctx) => YourPlace(context, "Your place", restaurantModel[0]),
                point: LatLng(latitudeData, longitudeData),
              ),
              //_buildPoints(state.restaurantsList)
            ],
          ),
        ],
      );

  //Widget _buildPoints(List<RestaurantModel> data) => Marker(point: point, builder: builder)

  Widget _progress() => Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      );
}
