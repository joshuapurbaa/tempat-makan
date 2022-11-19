import 'package:core/src/data/models/restaurant_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_response.g.dart';

@JsonSerializable()
class RestaurantResponse extends Equatable {
  @JsonKey(name: 'restaurants')
  final List<RestaurantModel> restaurantList;

  const RestaurantResponse({
    required this.restaurantList,
  });

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantResponseToJson(this);

  @override
  List<Object?> get props => [restaurantList];
}
