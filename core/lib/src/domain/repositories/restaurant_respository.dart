import 'package:core/core.dart';

import 'package:dartz/dartz.dart';

abstract class RestaurantRepository {
  Future<Either<Failure, List<Restaurant>>> getRestaurantList();
  Future<Either<Failure, RestaurantDetail>> getRestaurantDetail(String id);
}
