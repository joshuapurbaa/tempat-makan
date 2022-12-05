import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, Register>> register(RegisterParams registerParams);
  Future<Either<Failure, Login>> login(LoginParams loginParams);
  Future<Either<Failure, User>> user();
}
