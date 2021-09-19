import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dactyl_test_app/bloc/restaurants/restaurants_event.dart';
import 'package:dactyl_test_app/bloc/restaurants/restaurants_state.dart';
import 'package:dactyl_test_app/models/restaurant_model.dart';
import 'package:dactyl_test_app/providers/restaurants_data_provider.dart';
import 'package:dactyl_test_app/utils/get_location.dart';

class RestaurantsBloc extends Bloc<RestaurantsEvent, MainState> {
  final RestaurantsDataProvider restaurantsDataProvider;

  RestaurantsBloc(this.restaurantsDataProvider) : super(LoadingRestaurantsState(restaurants: [])) {
    _getLocationData();
  }

  late double latitudeData;
  late double longitudeData;
  late List<RestaurantModel> restaurants;
  late var index;

  @override
  Stream<MainState> mapEventToState(
    RestaurantsEvent event,
  ) async* {
    if (event is DataLoadedEvent) {
      yield state.copyWith(restaurantsList: restaurants);
    }
  }

  Future _loadData() async {
    final data = await restaurantsDataProvider.getData(); //error
    add(DataLoadedEvent(
      data,
    ));
    restaurants = data;
  }

  Future<List<double>> _getLocationData() async {
    var locData = await GetLocation().getLocation();
    latitudeData = locData.latitude;
    longitudeData = locData.longitude;
    List<double> location = [latitudeData, longitudeData];
    await _loadData();
    return location;
  }
}
