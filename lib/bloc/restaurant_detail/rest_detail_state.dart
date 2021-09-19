import 'package:dactyl_test_app/models/restaurant_detail_model.dart';
import 'package:equatable/equatable.dart';

abstract class RestDetailState extends Equatable {}

class MainState extends RestDetailState {
  final RestaurantDetailModel restaurantDetail;

  MainState({required this.restaurantDetail});

  MainState copyWith({
    RestaurantDetailModel? restDetail,
  }) {
    return MainState(
      restaurantDetail: restDetail!,
    );
  }

  @override
  List<Object?> get props => [];
}

class LoadingRestDetailState extends MainState {
  LoadingRestDetailState()
      : super(
            restaurantDetail:
                RestaurantDetailModel(id: '', name: '', address: '', averageCostForTwo: 0));
}
