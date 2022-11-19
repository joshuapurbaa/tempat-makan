import 'package:core/src/data/models/restaurant_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_response.g.dart';

@JsonSerializable()
class RestaurantResponse extends Equatable {
  final List<RestaurantModel> restaurants;

  const RestaurantResponse({
    required this.restaurants,
  });

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantResponseToJson(this);

  @override
  List<Object?> get props => [restaurants];
}
