import 'package:core/src/domain/usecases/auth/auth.dart';

import 'model/auth/auth.dart';

abstract class AuthRemoteDatasource {
  Future<RegisterResponse> register(RegisterParams registerParams);
  Future<LoginResponse> login(LoginParams loginParams);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDatasource {
  @override
  Future<LoginResponse> login(LoginParams loginParams) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<RegisterResponse> register(RegisterParams registerParams) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
