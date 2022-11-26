import 'dart:convert';

import 'package:core/core.dart';
import 'package:http/http.dart' as http;

import '../datasources.dart';

abstract class AuthRemoteDatasource {
  Future<RegisterResponse> register(RegisterParams registerParams);
  Future<LoginResponse> login(LoginParams loginParams);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDatasource {
  final http.Client _client;

  AuthRemoteDataSourceImpl(this._client);

  @override
  Future<LoginResponse> login(LoginParams loginParams) async {
    try {
      final response = await _client.post(
        Uri.parse(ListApi.login),
        headers: {'Content-Type': 'application/json'},
        body: loginParams.toJson(),
      );

      final statusCode = response.statusCode;
      print('Status code login from remote data sources: $statusCode');
      final result = LoginResponse.fromJson(json.decode(response.body));
      print('Result login from remote data sources: $result');

      if (statusCode == 200) {
        return result;
      } else {
        throw ServerException(result.error);
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<RegisterResponse> register(RegisterParams registerParams) async {
    try {
      final response = await _client.post(
        Uri.parse(ListApi.register),
        headers: {'Content-Type': 'application/json;'},
        body: registerParams.toJson(),
      );

      final statusCode = response.statusCode;
      print('Status code from remote data sources: $statusCode');
      final result = RegisterResponse.fromJson(json.decode(response.body));
      print('Result register from remote data sources: $result');

      if (statusCode == 200) {
        return result;
      } else {
        throw ServerException(result.error);
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}
