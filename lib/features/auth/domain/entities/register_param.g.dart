// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterParams _$RegisterParamsFromJson(Map json) => _RegisterParams(
      email: json['email'] as String,
      password: json['password'] as String,
      workspace: WorkSpaceParams.fromJson(
          Map<String, dynamic>.from(json['workspace'] as Map)),
    );

Map<String, dynamic> _$RegisterParamsToJson(_RegisterParams instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'workspace': instance.workspace.toJson(),
    };
