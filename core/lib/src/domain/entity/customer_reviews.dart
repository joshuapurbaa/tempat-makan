import 'package:equatable/equatable.dart';

class CustomerReviews extends Equatable {
  final String name;
  final String review;
  final String date;

  const CustomerReviews({
    required this.name,
    required this.review,
    required this.date,
  });
  @override
  List<Object?> get props => [
        name,
        review,
        date,
      ];
}
