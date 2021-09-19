import 'package:flutter/foundation.dart';


@immutable
class RestaurantDetailModel {

  const RestaurantDetailModel({
    required this.id,
    required this.name,
    required this.address,
    required this.averageCostForTwo,
  });

  final String id;
  final String name;
  final String address;
  final int averageCostForTwo;

  factory RestaurantDetailModel.fromJson(Map<String,dynamic> json) => RestaurantDetailModel(
    id: json['id'] as String,
    name: json['name'] as String,
    address: json['address'] as String,
    averageCostForTwo: json['average_cost_for_two'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'address': address,
    'average_cost_for_two': averageCostForTwo
  };

  RestaurantDetailModel clone() => RestaurantDetailModel(
    id: id,
    name: name,
    address: address,
    averageCostForTwo: averageCostForTwo
  );


  RestaurantDetailModel copyWith({
    String? id,
    String? name,
    String? address,
    int? averageCostForTwo
  }) => RestaurantDetailModel(
    id: id ?? this.id,
    name: name ?? this.name,
    address: address ?? this.address,
    averageCostForTwo: averageCostForTwo ?? this.averageCostForTwo,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RestaurantDetailModel && id == other.id && name == other.name && address == other.address && averageCostForTwo == other.averageCostForTwo;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ address.hashCode ^ averageCostForTwo.hashCode;
}
