// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map json) => ErrorModel(
      code: (json['code'] as num?)?.toInt(),
      info: json['info'] as String?,
    );

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      if (instance.code case final value?) 'code': value,
      if (instance.info case final value?) 'info': value,
    };
