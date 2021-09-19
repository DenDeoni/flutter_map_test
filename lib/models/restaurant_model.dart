import 'package:flutter/foundation.dart';


@immutable
class RestaurantModel {

  const RestaurantModel({
    required this.restaurant,
  });

  final Restaurant restaurant;

  factory RestaurantModel.fromJson(Map<String,dynamic> json) => RestaurantModel(
    restaurant: Restaurant.fromJson(json['restaurant'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'restaurant': restaurant.toJson()
  };

  RestaurantModel clone() => RestaurantModel(
    restaurant: restaurant.clone()
  );


  RestaurantModel copyWith({
    Restaurant? restaurant
  }) => RestaurantModel(
    restaurant: restaurant ?? this.restaurant,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RestaurantModel && restaurant == other.restaurant;

  @override
  int get hashCode => restaurant.hashCode;
}

@immutable
class Restaurant {

  const Restaurant({
    required this.id,
    required this.name,
    required this.location,
    required this.cuisines,
    required this.averageCostForTwo,
  });

  final String id;
  final String name;
  final Location location;
  final String cuisines;
  final int averageCostForTwo;

  factory Restaurant.fromJson(Map<String,dynamic> json) => Restaurant(
    id: json['id'] as String,
    name: json['name'] as String,
    location: Location.fromJson(json['location'] as Map<String, dynamic>),
    cuisines: json['cuisines'] as String,
    averageCostForTwo: json['average_cost_for_two'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'location': location.toJson(),
    'cuisines': cuisines,
    'average_cost_for_two': averageCostForTwo
  };

  Restaurant clone() => Restaurant(
    id: id,
    name: name,
    location: location.clone(),
    cuisines: cuisines,
    averageCostForTwo: averageCostForTwo
  );


  Restaurant copyWith({
    String? id,
    String? name,
    Location? location,
    String? cuisines,
    int? averageCostForTwo
  }) => Restaurant(
    id: id ?? this.id,
    name: name ?? this.name,
    location: location ?? this.location,
    cuisines: cuisines ?? this.cuisines,
    averageCostForTwo: averageCostForTwo ?? this.averageCostForTwo,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Restaurant && id == other.id && name == other.name && location == other.location && cuisines == other.cuisines && averageCostForTwo == other.averageCostForTwo;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ location.hashCode ^ cuisines.hashCode ^ averageCostForTwo.hashCode;
}

@immutable
class Location {

  const Location({
    required this.address,
    required this.locality,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.zipcode,
  });

  final String address;
  final String locality;
  final String city;
  final String latitude;
  final String longitude;
  final String zipcode;

  factory Location.fromJson(Map<String,dynamic> json) => Location(
    address: json['address'] as String,
    locality: json['locality'] as String,
    city: json['city'] as String,
    latitude: json['latitude'] as String,
    longitude: json['longitude'] as String,
    zipcode: json['zipcode'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'address': address,
    'locality': locality,
    'city': city,
    'latitude': latitude,
    'longitude': longitude,
    'zipcode': zipcode
  };

  Location clone() => Location(
    address: address,
    locality: locality,
    city: city,
    latitude: latitude,
    longitude: longitude,
    zipcode: zipcode
  );


  Location copyWith({
    String? address,
    String? locality,
    String? city,
    String? latitude,
    String? longitude,
    String? zipcode
  }) => Location(
    address: address ?? this.address,
    locality: locality ?? this.locality,
    city: city ?? this.city,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    zipcode: zipcode ?? this.zipcode,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Location && address == other.address && locality == other.locality && city == other.city && latitude == other.latitude && longitude == other.longitude && zipcode == other.zipcode;

  @override
  int get hashCode => address.hashCode ^ locality.hashCode ^ city.hashCode ^ latitude.hashCode ^ longitude.hashCode ^ zipcode.hashCode;
}
