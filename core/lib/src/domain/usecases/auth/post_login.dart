import 'package:core/src/domain/repositories/auth_repository.dart';
import 'package:core/src/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:core/src/utils/failure.dart';

import '../../entities/auth/login.dart';

class PostLogin extends UseCase<Login, LoginParams> {
  final AuthRepository _repository;

  PostLogin(this._repository);
  @override
  Future<Either<Failure, Login>> execute(LoginParams params) =>
      _repository.login(params);
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({
    this.email = '',
    this.password = '',
  });
}
