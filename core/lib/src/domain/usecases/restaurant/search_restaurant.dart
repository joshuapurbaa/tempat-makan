import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class SearchRestaurant {
  final RestaurantRepository repository;

  SearchRestaurant(this.repository);
  Future<Either<Failure, List<Restaurant>>> execute(String query) {
    return repository.searchRestaurant(query);
  }
}
