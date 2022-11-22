import 'dart:io';

import 'package:core/core.dart';

import 'package:dartz/dartz.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantRemoteDataSource remoteDataSource;

  RestaurantRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Restaurant>>> getRestaurantList() async {
    try {
      final result = await remoteDataSource.getRestaurantList();
      return Right(result.map((model) => model.toEntity()).toList());
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, RestaurantDetail>> getRestaurantDetail(
      String id) async {
    try {
      final result = await remoteDataSource.getRestaurantDetail(id);
      return Right(result.toEntity());
    } on SocketException {
      return const Left(ConnectionFailure(''));
    }
  }

  @override
  Future<Either<Failure, List<Restaurant>>> searchRestaurant(
      String query) async {
    try {
      final result = await remoteDataSource.searchRestaurant(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
