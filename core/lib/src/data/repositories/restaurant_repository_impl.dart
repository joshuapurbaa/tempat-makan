import 'dart:io';

import 'package:core/src/data/datasources/restaurant_local_data_source.dart';
import 'package:core/src/domain/entity/restaurant.dart';

import 'package:core/src/domain/repositories/restaurant_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:core/src/utils/failure.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantLocalDataSource restaurantLocalDataSource;

  RestaurantRepositoryImpl({required this.restaurantLocalDataSource});

  @override
  Future<Either<Failure, List<Restaurant>>> getRestaurantdata() async {
    try {
      final result = await restaurantLocalDataSource.getRestaurantList();
      return Right(result.map((model) => model.toEntity()).toList());
    } on SocketException {
      return const Left(ConnectionFailure('Failed to get data'));
    }
  }
}
