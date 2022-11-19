import 'package:core/src/domain/entity/restaurant.dart';

import 'package:dartz/dartz.dart';

import '../../utils/failure.dart';

abstract class RestaurantRepository {
  Future<Either<Failure, List<Restaurant>>> getRestaurantdata();
}
