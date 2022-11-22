import 'package:core/src/domain/entities/auth/auth.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends Equatable {
  final int? id;
  final String? token;
  final String? error;

  const LoginResponse({
    this.id,
    this.token,
    this.error,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  Login toEntity() {
    return Login(token);
  }

  @override
  List<Object?> get props => [
        id,
        token,
        error,
      ];
}
