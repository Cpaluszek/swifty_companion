import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'achievement_model.freezed.dart';
part 'achievement_model.g.dart';

@freezed
class AchievementModel with _$AchievementModel {
  const AchievementModel._();

  @JsonSerializable(includeIfNull: false)
  const factory AchievementModel({
    required int id,
    required String name,
    required String description,
    required String tier,
    required String image,
    @JsonKey(name: "nbr_of_success") required int? nbrOfSuccess,
    required bool isVisible,
  }) = _AchievementModel;

  factory AchievementModel.fromJson(Map<String, Object?> json) =>
      _$AchievementModelFromJson(json);
}
