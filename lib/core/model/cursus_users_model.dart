import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:swifty_companion/core/model/skill_model.dart';

part 'cursus_users_model.freezed.dart';
part 'cursus_users_model.g.dart';

@freezed
class CursusUsersModel with _$CursusUsersModel {
  const CursusUsersModel._();

  @JsonSerializable(includeIfNull: false)
  const factory CursusUsersModel({
    required int id,
    @JsonKey(name: 'cursus_id') required int cursusId,
    required String? grade,
    required double level,
    required List<SkillModel> skill,
    required CursusModel cursus,
  }) = _CursusUsersModel;

  factory CursusUsersModel.fromJson(Map<String, Object?> json) =>
      _$CursusUsersModelFromJson(json);
}

@freezed
class CursusModel with _$CursusModel {
  const CursusModel._();

  @JsonSerializable(includeIfNull: false)
  const factory CursusModel({
    required int id,
    required String name,
    required String slug,
    required String kind,
  }) = _CursusModel;

  factory CursusModel.fromJson(Map<String, Object?> json) =>
      _$CursusModelFromJson(json);
}
