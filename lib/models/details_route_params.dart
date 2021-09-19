import 'package:dactyl_test_app/models/restaurant_model.dart';

class DetailsRouteParameters {
  final RestaurantModel restaurantModel;
  final String id;
  final String name;
  final String address;
  final int cost;

  DetailsRouteParameters(this.restaurantModel, this.id, this.name, this.address, this.cost);
}
