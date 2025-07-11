// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserParams _$UserParamsFromJson(Map json) => _UserParams(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserParamsToJson(_UserParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      if (instance.email case final value?) 'email': value,
    };
