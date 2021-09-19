import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dactyl_test_app/bloc/restaurant_detail/rest_detail_bloc.dart';
import 'package:dactyl_test_app/bloc/restaurant_detail/rest_detail_state.dart';
import 'package:dactyl_test_app/generated/locale_keys.g.dart';
import 'package:dactyl_test_app/models/restaurant_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';

class DetailBody extends StatelessWidget {
  RestaurantModel restaurantModel;
  String id;

  DetailBody(this.restaurantModel, this.id);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestDetailBloc, MainState>(
      builder: (context, state) {
        this.id = state.restaurantDetail.id;
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              _close(context),
              _divider(),
              _details(context, state.restaurantDetail.name, state.restaurantDetail.address,
                  state.restaurantDetail.averageCostForTwo),
              _divider(),
            ],
          ),
        );
      },
    );
  }

  Widget _divider() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Divider(
        color: Color(0xFFD8D8D8),
      ),
    );
  }

  Widget _close(context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: SvgPicture.asset(
        'assets/images/ic_close.svg',
        width: 30,
        height: 30,
      ),
    );
  }

  Widget _details(context, String name, String contacts, int cost) {
    TextStyle textStyleHeader = TextStyle(fontSize: 22, fontWeight: FontWeight.w600);
    TextStyle textStyleKey = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
    TextStyle textStyleVal = TextStyle(fontSize: 16, fontWeight: FontWeight.w300);

    Widget name = Row(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Text(
          restaurantModel.restaurant.name,
          style: textStyleHeader,
        ),
      )
    ]);

    Widget address = Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        LocaleKeys.address.tr(),
        style: textStyleKey,
        maxLines: 3,
      ),
      Flexible(
        child: Column(
          children: [
            Text(
              restaurantModel.restaurant.location.address,
              style: textStyleVal,
            ),
          ],
        ),
      )
    ]);

    Widget pricing = Row(children: [
      Text(
        LocaleKeys.average_cost.tr(),
        style: textStyleKey,
      ),
      Text(
        restaurantModel.restaurant.averageCostForTwo.toString(),
        style: textStyleVal,
      )
    ]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: name,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: address,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: pricing,
        ),
      ],
    );
  }
}
