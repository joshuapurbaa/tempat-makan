import 'package:core/src/domain/entities/auth/user.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends Equatable {
  final DataUser? data;
  final SupportUser? support;
  final String? error;

  const UserResponse({
    this.error,
    this.data,
    this.support,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  User toEntity() {
    return User(
      name: '${data!.firstName} ${data!.lastName}',
      avatar: data!.avatar,
      email: data!.email,
    );
  }

  @override
  List<Object?> get props => [data, support];
}

@JsonSerializable()
class SupportUser extends Equatable {
  final String? url;
  final String? text;

  const SupportUser({
    this.url,
    this.text,
  });

  factory SupportUser.fromJson(Map<String, dynamic> json) =>
      _$SupportUserFromJson(json);

  Map<String, dynamic> toJson() => _$SupportUserToJson(this);

  @override
  List<Object?> get props => [url, text];
}

@JsonSerializable()
class DataUser extends Equatable {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const DataUser({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) =>
      _$DataUserFromJson(json);

  Map<String, dynamic> toJson() => _$DataUserToJson(this);

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        avatar,
      ];
}
