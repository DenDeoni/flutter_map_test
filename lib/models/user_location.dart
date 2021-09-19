import 'package:equatable/equatable.dart';

class UserLocation extends Equatable {
  final double longitude;
  final double latitude;

  UserLocation(this.longitude, this.latitude);

  @override
  List<Object?> get props => [] + [latitude] + [longitude];
}
