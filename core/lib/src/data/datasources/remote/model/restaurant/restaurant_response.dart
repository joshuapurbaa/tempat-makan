import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_response.g.dart';

@JsonSerializable()
class RestaurantResponse extends Equatable {
  @JsonKey(name: 'restaurants')
  final List<RestaurantModel> restaurantList;
  final bool? error;

  const RestaurantResponse({
    required this.restaurantList,
    this.error,
  });

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantResponseToJson(this);

  @override
  List<Object?> get props => [restaurantList, error];
}
