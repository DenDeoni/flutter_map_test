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

  ListItem(this.restaurantModel, this.id);

  Future _openDetails(BuildContext context) async {
    await Navigator.of(context)
        .pushNamed(RESTAURANT_DETAIL, arguments: DetailsRouteParameters(restaurantModel, id));
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
              spreadRadius: 0,
              blurRadius: 0,
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
                padding: EdgeInsets.symmetric(horizontal: leftPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
