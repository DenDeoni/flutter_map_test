import 'package:dactyl_test_app/models/restaurant_model.dart';
import 'package:equatable/equatable.dart';

abstract class RestaurantsState extends Equatable {}

class MainState extends RestaurantsState {
  final List<RestaurantModel> restaurantsList;

  MainState({
    required this.restaurantsList,
  });

  @override
  List<Object?> get props => [] + restaurantsList;

  MainState copyWith({
    List<RestaurantModel>? restaurantsList,
  }) {
    return MainState(
      restaurantsList: restaurantsList ?? [],
    );
  }
}

class LoadingRestaurantsState extends MainState {
  LoadingRestaurantsState({restaurants}) : super(restaurantsList: []);

  @override
  List<Object?> get props => [];
}
