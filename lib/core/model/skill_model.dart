import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'skill_model.freezed.dart';
part 'skill_model.g.dart';

@freezed
class SkillModel with _$SkillModel {
  const SkillModel._();

  @JsonSerializable(includeIfNull: false)
  const factory SkillModel({
    required int id,
    required String name,
    required double level,
  }) = _SkillModel;

  factory SkillModel.fromJson(Map<String, Object?> json) => _$SkillModelFromJson(json);
}
