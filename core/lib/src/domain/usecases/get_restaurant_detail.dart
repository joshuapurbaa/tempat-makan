import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class GetRestaurantDetail {
  final RestaurantRepository repository;

  GetRestaurantDetail(this.repository);
  Future<Either<Failure, RestaurantDetail>> execute(String id) {
    return repository.getRestaurantDetail(id);
  }
}
