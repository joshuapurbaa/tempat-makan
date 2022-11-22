import 'package:json_annotation/json_annotation.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

part 'restaurant_detail_model.g.dart';

@JsonSerializable()
class RestaurantDetailModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<CategoryModel> categories;
  final MenuModel menus;
  final double rating;
  final List<CustomerReviewsModel> customerReviews;

  const RestaurantDetailModel({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantDetailModelToJson(this);

  RestaurantDetail toEntity() {
    return RestaurantDetail(
      id: id,
      name: name,
      description: description,
      city: city,
      address: address,
      pictureId: pictureId,
      categories: categories.map((category) => category.toEntity()).toList(),
      menus: menus.toEntity(),
      rating: rating,
      customerReviews:
          customerReviews.map((review) => review.toEntity()).toList(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        city,
        address,
        pictureId,
        categories,
        menus,
        rating,
        customerReviews,
      ];
}
