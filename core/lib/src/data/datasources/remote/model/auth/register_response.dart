import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse extends Equatable {
  final int? id;
  final String? token;
  final String? error;

  const RegisterResponse({
    this.id,
    this.token,
    this.error,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);

  Register toEntity() {
    return Register(token);
  }

  @override
  List<Object?> get props => [
        id,
        token,
        error,
      ];
}
