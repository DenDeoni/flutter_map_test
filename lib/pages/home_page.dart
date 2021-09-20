import 'package:dactyl_test_app/bloc/restaurants/restaurants_bloc.dart';
import 'package:dactyl_test_app/bloc/restaurants/restaurants_state.dart';
import 'package:dactyl_test_app/generated/locale_keys.g.dart';
import 'package:dactyl_test_app/models/index.dart';
import 'package:dactyl_test_app/utils/consts.dart';
import 'package:dactyl_test_app/widgets/bottom_bar.dart';
import 'package:dactyl_test_app/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static const routeName = HOME;
  String latitudeData = "";
  String longitudeData = "";

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
        bottomNavigationBar: BottomNavBar(),
        body: BlocBuilder<RestaurantsBloc, MainState>(
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
                            : Expanded(child: _buildList(state.restaurantsList)),
                  ),
                ],
              ),
            );
          },
        ),
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
        children: data.map((item) => ListItem(item)).toList(growable: false),
      ),
    );
  }
}
