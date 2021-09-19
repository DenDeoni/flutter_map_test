import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:dactyl_test_app/models/details_route_params.dart';
import 'package:dactyl_test_app/models/restaurant_model.dart';
import 'package:dactyl_test_app/utils/consts.dart';

import 'object_description.dart';
import 'object_name.dart';

class ListItem extends StatelessWidget {
  static const leftPadding = 14.0;
  final RestaurantModel restaurantModel;
  final String id;
  final String name;
  final String address;
  final int cost;

  ListItem(this.restaurantModel, this.id, this.name, this.address, this.cost);

  Future _openDetails(BuildContext context) async {
    await Navigator.of(context).pushNamed(RESTAURANT_DETAIL,
        arguments: DetailsRouteParameters(restaurantModel, id, name, address, cost));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Open detail window
      onTap: () => _openDetails(context),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 3,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          color: Colors.white,
          //border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          children: [
            Expanded(
              // Block under photo
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ObjectName(restaurantModel.restaurant.name),
                    ObjectDescription(restaurantModel.restaurant.cuisines),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
