// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantDetailResponse _$RestaurantDetailResponseFromJson(
        Map<String, dynamic> json) =>
    RestaurantDetailResponse(
      error: json['error'] as bool?,
      restaurant: RestaurantDetailModel.fromJson(
          json['restaurant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RestaurantDetailResponseToJson(
        RestaurantDetailResponse instance) =>
    <String, dynamic>{
      'restaurant': instance.restaurant,
      'error': instance.error,
    };
