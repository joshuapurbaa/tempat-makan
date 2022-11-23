import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'restaurant_detail_response.g.dart';

@JsonSerializable()
class RestaurantDetailResponse extends Equatable {
  final RestaurantDetailModel restaurant;
  final bool? error;

  const RestaurantDetailResponse({this.error, required this.restaurant});

  factory RestaurantDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantDetailResponseToJson(this);

  @override
  List<Object?> get props => [restaurant, error];
}
