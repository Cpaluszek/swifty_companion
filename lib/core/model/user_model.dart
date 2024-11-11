import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  @JsonSerializable(includeIfNull: false)
  const factory UserModel({
    required String login,
    @JsonKey(name: 'displayname') required String displayName,
    required String email,
    // required String level,
    required String? location,
    required int wallet,
    @JsonKey(name: 'correction_point') required int evaluationPoints,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
