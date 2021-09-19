import 'package:dactyl_test_app/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dactyl_test_app/generated/locale_keys.g.dart';
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
  var _centralPoint;
  late MapController mapController;

  /*ScreenCoordinate screenCoordinate = ScreenCoordinate(
    x: (window.physicalSize.width / 2).round(),
    y: (window.physicalSize.height / 2).round(),
  );*/

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
/*      appBar: AppBar(
        centerTitle: true,
        title: Text(LocaleKeys.select_map.tr()),
      ),
      drawer: BuildingLeftDrawer(),*/
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                child: _currentPosition != null ? _flutterMap() : _progress(),
              ),
/*              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context); //popAndPushNamed(context, HOME);
                  },
                  child: SvgPicture.asset(
                    'assets/images/back_arrow.svg',
                    alignment: Alignment.centerLeft,
                    width: 35,
                    height: 35,
                  ),
                ),
              ),*/
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _getCentralPointCoordinates();
                      Navigator.pop(context);
                    },
                    child: Text("use point"),
                  ),
                ],
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/images/aim.svg',
                  color: Colors.black,
                  width: 80,
                ),
              )
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
          TileLayerOptions(urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              //"http://tiles.maps.sputnik.ru/{z}/{x}/{y}.png",
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
