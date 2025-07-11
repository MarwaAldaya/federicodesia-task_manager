// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEntity _$UserEntityFromJson(Map json) => _UserEntity(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      workspaces: (json['workspaces'] as List<dynamic>?)
          ?.map((e) =>
              WorkspaceEntity.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$UserEntityToJson(_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      if (instance.workspaces?.map((e) => e.toJson()).toList()
          case final value?)
        'workspaces': value,
    };
