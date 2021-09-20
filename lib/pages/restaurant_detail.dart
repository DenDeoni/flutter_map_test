import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dactyl_test_app/models/restaurant_model.dart';
import 'package:dactyl_test_app/utils/consts.dart';
import 'package:dactyl_test_app/widgets/restaurant_detail_page/detail_body.dart';

class RestaurantDetail extends StatelessWidget {
  final RestaurantModel restaurantModel;

  RestaurantDetail(this.restaurantModel);

  static const routeName = RESTAURANT_DETAIL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DetailBody(restaurantModel),
      ),
    );
  }
}
