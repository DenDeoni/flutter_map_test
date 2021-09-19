import 'package:dactyl_test_app/models/restaurant_model.dart';
import 'package:equatable/equatable.dart';

abstract class RestDetailEvent extends Equatable {}

class DataLoadedEvent extends RestDetailEvent {
  final String id;
  final RestaurantModel data;
  DataLoadedEvent(this.id, this.data);

  @override
  List<Object?> get props => [data];
}


