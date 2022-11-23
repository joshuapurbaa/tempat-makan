import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'customer_review_model.dart';

part 'customer_reviews_response.g.dart';

@JsonSerializable()
class CustomerReviewsResponse extends Equatable {
  final List<CustomerReviewsModel> customerReviews;
  final bool? error;

  const CustomerReviewsResponse({this.error, required this.customerReviews});

  factory CustomerReviewsResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerReviewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerReviewsResponseToJson(this);

  @override
  List<Object?> get props => [customerReviews, error];
}
