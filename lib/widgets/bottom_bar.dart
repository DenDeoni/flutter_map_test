import 'package:dactyl_test_app/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dactyl_test_app/generated/locale_keys.g.dart';

class BottomNavBar extends StatelessWidget {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return bottomBar(context);
  }

  Widget bottomBar(context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (value) {
        final routes = [HOME, GEO_MAP];
        _currentIndex = value;
        Navigator.of(context).pushNamedAndRemoveUntil(routes[value], (route) => false);
      },
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          activeIcon: Icon(
            Icons.list,
            color: Colors.black87,
          ),
          label: LocaleKeys.list.tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          activeIcon: Icon(
            Icons.map,
            color: Colors.black87,
          ),
          label: LocaleKeys.map.tr(),
        ),
      ],
    );
  }
}
