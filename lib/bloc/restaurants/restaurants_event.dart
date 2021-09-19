import 'package:equatable/equatable.dart';
import 'package:dactyl_test_app/models/restaurant_model.dart';

abstract class RestaurantsEvent extends Equatable {}

class DataLoadedEvent extends RestaurantsEvent {
  final List<RestaurantModel> data;

  DataLoadedEvent(this.data);

  @override
  List<Object> get props => [data];
}
