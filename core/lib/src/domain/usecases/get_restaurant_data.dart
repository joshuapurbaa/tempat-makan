import 'package:core/src/domain/entity/restaurant.dart';
import 'package:core/src/domain/repositories/restaurant_respository.dart';
import 'package:core/src/utils/failure.dart';
import 'package:dartz/dartz.dart';

class GetRestaurantData {
  final RestaurantRepository repository;

  GetRestaurantData(this.repository);
  Future<Either<Failure, List<Restaurant>>> execute() {
    return repository.getRestaurantdata();
  }
}
