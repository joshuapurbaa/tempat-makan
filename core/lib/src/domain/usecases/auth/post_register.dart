import 'package:core/src/domain/entities/auth/register.dart';
import 'package:core/src/domain/repositories/auth_repository.dart';
import 'package:core/src/utils/failure.dart';
import 'package:core/src/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class PostRegister extends UseCase<Register, RegisterParams> {
  final AuthRepository _repository;

  PostRegister(this._repository);

  @override
  Future<Either<Failure, Register>> execute(RegisterParams params) =>
      _repository.register(params);
}

class RegisterParams {
  final String email;
  final String password;

  RegisterParams(
    this.email,
    this.password,
  );
}
