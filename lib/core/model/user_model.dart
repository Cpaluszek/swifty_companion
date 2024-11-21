import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:swifty_companion/core/model/achievement_model.dart';
import 'package:swifty_companion/core/model/campus_model.dart';
import 'package:swifty_companion/core/model/cursus_users_model.dart';
import 'package:swifty_companion/core/model/image_model.dart';
import 'package:swifty_companion/core/model/project_users_model.dart';
import 'package:swifty_companion/core/model/skill_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  @JsonSerializable(includeIfNull: false)
  const factory UserModel({
    required int id,
    required String email,
    required String login,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String url,
    required String phone,
    required String kind,
    @JsonKey(name: 'displayname') required String displayName,
    required String? location,
    required int wallet,
    @JsonKey(name: 'correction_point') required int evaluationPoints,
    required ImageModel image,
    @JsonKey(name: 'pool_month') required String poolMonth,
    @JsonKey(name: 'pool_year') required String poolYear,
    @JsonKey(name: 'alumni?') required bool isAlumni,
    @JsonKey(name: 'active?') required bool isActive,
    required List<CampusModel> campus,
    @JsonKey(name: 'cursus_users') required List<CursusUsersModel> cursusUsers,
    @JsonKey(name: 'projects_users') required List<ProjectUsersModel> projectUsers,
    required List<AchievementModel> achievements,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);

  List<SkillModel> getAllSkills() {
    final Map<String, SkillModel> skillMap = {};

    for (final cursusUser in cursusUsers) {
      for (final skill in cursusUser.skills) {
        if (skillMap.containsKey(skill.name)) {
          // Combine duplicate skills
          final existingSkill = skillMap[skill.name]!;
          skillMap[skill.name] = skill.copyWith(level: max(skill.level, existingSkill.level));
        } else {
          skillMap[skill.name] = skill;
        }
      }
    }
    return skillMap.values.toList();
  }
}
