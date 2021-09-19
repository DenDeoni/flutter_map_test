import 'package:equatable/equatable.dart';

class UserParams extends Equatable {
  final double latitude;
  final double longitude;

  UserParams({required this.latitude, required this.longitude});

  @override
  // TODO: implement props
  List<Object?> get props => [] + [latitude] + [longitude];
}
