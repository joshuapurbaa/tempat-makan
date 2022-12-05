// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      error: json['error'] as String?,
      data: json['data'] == null
          ? null
          : DataUser.fromJson(json['data'] as Map<String, dynamic>),
      support: json['support'] == null
          ? null
          : SupportUser.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'support': instance.support,
      'error': instance.error,
    };

SupportUser _$SupportUserFromJson(Map<String, dynamic> json) => SupportUser(
      url: json['url'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$SupportUserToJson(SupportUser instance) =>
    <String, dynamic>{
      'url': instance.url,
      'text': instance.text,
    };

DataUser _$DataUserFromJson(Map<String, dynamic> json) => DataUser(
      id: json['id'] as int?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$DataUserToJson(DataUser instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'avatar': instance.avatar,
    };
