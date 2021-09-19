import 'package:flutter/material.dart';

class ObjectDescription extends StatelessWidget {
  final String description;

  ObjectDescription(this.description);

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      maxLines: 2,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 12.0,
        color: Colors.black45,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
