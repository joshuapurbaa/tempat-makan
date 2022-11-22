import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer_review_model.g.dart';

@JsonSerializable()
class CustomerReviewsModel extends Equatable {
  final String? id;
  final String name;
  final String review;
  final String date;

  const CustomerReviewsModel(
    this.id, {
    required this.name,
    required this.review,
    required this.date,
  });

  factory CustomerReviewsModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerReviewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerReviewsModelToJson(this);

  CustomerReviews toEntity() {
    return CustomerReviews(
      name: name,
      review: review,
      date: date,
    );
  }

  @override
  List<Object?> get props => [
        name,
        review,
        date,
      ];
}
