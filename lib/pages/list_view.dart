import 'package:dactyl_test_app/models/restaurant_model.dart';
import 'package:dactyl_test_app/widgets/list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dactyl_test_app/bloc/restaurants/restaurants_bloc.dart';
import 'package:dactyl_test_app/bloc/restaurants/restaurants_state.dart';

class RestaurantsList extends StatelessWidget {
  const RestaurantsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<RestaurantsBloc, MainState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              verticalDirection: VerticalDirection.up,
              children: [
                Container(
                  // Restaurants list
                  child: state is LoadingRestaurantsState
                      ? Container(height: 350, child: Center(child: CircularProgressIndicator()))
                      : state.restaurantsList.isEmpty
                          ? Container(
                              height: 350, child: Center(child: CircularProgressIndicator()))
                          : Expanded(
                              child: _buildList(state.restaurantsList),
                            ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildList(List<RestaurantModel> data) {
    return Scrollbar(
      child: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 3.9,
        mainAxisSpacing: 5.0,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        children: data.map<Widget>((item) => ListItem(item)).toList(growable: false),
      ),
    );
  }
}
