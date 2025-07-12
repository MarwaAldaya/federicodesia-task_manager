// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map json) => _UserModel(
      id: json['id'] as String,
      username: json['username'] as String?,
      email: json['email'] as String?,
      workspaces: workspacesFromJson(json['workspaces'] as List?),
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (instance.username case final value?) 'username': value,
      if (instance.email case final value?) 'email': value,
      if (workspacesToJson(instance.workspaces) case final value?)
        'workspaces': value,
    };
