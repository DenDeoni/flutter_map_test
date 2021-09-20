import 'package:dactyl_test_app/models/details_route_params.dart';
import 'package:dactyl_test_app/models/restaurant_model.dart';
import 'package:dactyl_test_app/utils/consts.dart';
import 'package:flutter/material.dart';

Widget locator(context, String text, restaurant) {
  return Column(
    children: [
      Text(''),
      InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(RESTAURANT_DETAIL, arguments: DetailsRouteParameters(restaurant));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 6.0),
          child: Icon(
            Icons.location_on_rounded,
            size: 35,
            color: Colors.indigoAccent,
          ),
        ),
      ),
      Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 3, right: 8, bottom: 3),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ),
    ],
  );
}
