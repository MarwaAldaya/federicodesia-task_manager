// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginModel _$LoginModelFromJson(Map json) => _LoginModel(
      user: json['user'] == null
          ? null
          : UserModel.fromJson(Map<String, dynamic>.from(json['user'] as Map)),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(_LoginModel instance) =>
    <String, dynamic>{
      if (instance.user?.toJson() case final value?) 'user': value,
      if (instance.token case final value?) 'token': value,
    };
