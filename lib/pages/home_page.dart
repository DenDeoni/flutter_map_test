import 'package:dactyl_test_app/generated/locale_keys.g.dart';
import 'package:dactyl_test_app/models/index.dart';
import 'package:dactyl_test_app/pages/list_view.dart';
import 'package:dactyl_test_app/utils/consts.dart';
import 'package:dactyl_test_app/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'geo_map.dart';

class HomePage extends StatefulWidget {
  static const routeName = HOME;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  String latitudeData = "";
  String longitudeData = "";

  final List<Map<String, dynamic>> tabBarNav = [
    {"title": Text(LocaleKeys.map.tr()), "icon": Icon(Icons.map)},
    {"title": Text(LocaleKeys.list.tr()), "icon": Icon(Icons.list)},
  ];

  late TabController _tabBarController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabBarController = TabController(length: tabBarNav.length, vsync: this, initialIndex: 0);
    _tabBarController.addListener(_tabBarListener);
  }

  _tabBarListener() {
    setState(() {
      _currentTabIndex = _tabBarController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            LocaleKeys.title.tr(),
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
        //bottomNavigationBar: BottomNavBar(),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blueAccent,
          onTap: (int index) {
            setState(() {
              _tabBarController.index = index;
              _currentTabIndex = index;
            });
          },
          currentIndex: _currentTabIndex,
          items: tabBarNav
              .map((item) => BottomNavigationBarItem(
                    icon: item["icon"],
                    title: item["title"],
                  ))
              .toList(),
        ),
        body: TabBarView(
          controller: _tabBarController,
          children: [
            GeoMap(),
            RestaurantsList(),
          ],
        ),
      ),
    );
  }

  Widget buildList(List<RestaurantModel> data) {
    return Scrollbar(
      child: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 3.9,
        mainAxisSpacing: 5.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        children: data.map((item) => ListItem(item)).toList(growable: false),
      ),
    );
  }
}
