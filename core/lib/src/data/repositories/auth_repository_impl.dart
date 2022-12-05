import 'dart:async';
import 'dart:io';

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  const AuthRepositoryImpl(this.authRemoteDatasource);

  @override
  Future<Either<Failure, Login>> login(LoginParams loginParams) async {
    try {
      final response = await authRemoteDatasource.login(loginParams);
      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException catch (e) {
      return Left(ConnectionFailure(e.message));
    } on TimeoutException catch (e) {
      return Left(TimeOutFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Register>> register(
      RegisterParams registerParams) async {
    try {
      final response = await authRemoteDatasource.register(registerParams);
      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException catch (e) {
      return Left(ConnectionFailure(e.message));
    } on TimeoutException catch (e) {
      return Left(TimeOutFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> user() async {
    try {
      final response = await authRemoteDatasource.user();
      final data = response.data;
      if (data?.firstName?.isEmpty ?? true) {
        return const Left(
          NoDataFailure('No user data'),
        );
      }
      return Right(response.toEntity());
    } on ServerException catch (e) {
      return Left(
        ServerFailure(e.message),
      );
    }
  }
}
