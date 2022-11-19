// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerReviewsModel _$CustomerReviewsModelFromJson(
        Map<String, dynamic> json) =>
    CustomerReviewsModel(
      name: json['name'] as String,
      review: json['review'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$CustomerReviewsModelToJson(
        CustomerReviewsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'review': instance.review,
      'date': instance.date,
    };
