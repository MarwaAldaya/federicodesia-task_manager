import 'package:bloc_arch/features/workspace/domain/params/workspace_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_param.freezed.dart';
part 'register_param.g.dart';

@freezed
abstract class RegisterParams with _$RegisterParams {
  const factory RegisterParams({
    required String email,
    required String password,
    required WorkSpaceParams workspace,
  }) = _RegisterParams;

  factory RegisterParams.fromJson(Map<String, dynamic> json) =>
      _$RegisterParamsFromJson(json);
}
