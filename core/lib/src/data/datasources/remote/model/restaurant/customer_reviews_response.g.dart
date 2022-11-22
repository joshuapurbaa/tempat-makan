// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_reviews_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerReviewsResponse _$CustomerReviewsResponseFromJson(
        Map<String, dynamic> json) =>
    CustomerReviewsResponse(
      customerReviews: (json['customerReviews'] as List<dynamic>)
          .map((e) => CustomerReviewsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerReviewsResponseToJson(
        CustomerReviewsResponse instance) =>
    <String, dynamic>{
      'customerReviews': instance.customerReviews,
    };
