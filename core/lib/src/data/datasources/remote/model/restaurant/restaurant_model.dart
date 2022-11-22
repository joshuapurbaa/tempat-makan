import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_model.g.dart';

@JsonSerializable()
class RestaurantModel extends Equatable {
  final String id;
  final String name;
  final String pictureId;
  final String city;
  final double rating;

  const RestaurantModel({
    required this.id,
    required this.name,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this);

  Restaurant toEntity() {
    return Restaurant(
      id: id,
      name: name,
      pictureId: pictureId,
      city: city,
      rating: rating,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        pictureId,
        city,
        rating,
      ];
}
