import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class GetRestaurantList {
  final RestaurantRepository repository;

  GetRestaurantList(this.repository);
  Future<Either<Failure, List<Restaurant>>> execute() {
    return repository.getRestaurantList();
  }
}
