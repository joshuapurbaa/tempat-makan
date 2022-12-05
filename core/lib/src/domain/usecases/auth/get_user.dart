import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class GetUser extends UseCase<User, NoParams> {
  final AuthRepository _repository;

  GetUser(this._repository);

  @override
  Future<Either<Failure, User>> execute(NoParams params) => _repository.user();
}
