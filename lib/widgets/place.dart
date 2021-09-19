import 'package:flutter/material.dart';

Widget place(context, String text) {
  return Column(
    children: [
      Text(''),
      Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 6.0),
        child: Icon(
          Icons.location_on_rounded,
          size: 35,
          color: Colors.pink,
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
