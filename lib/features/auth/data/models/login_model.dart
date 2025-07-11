import 'package:bloc_arch/features/user/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';

part 'login_model.g.dart';

@freezed
abstract class AuthModel with _$AuthModel {
  factory AuthModel({
    UserModel? user,
    String? token,
  }) = _LoginModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
