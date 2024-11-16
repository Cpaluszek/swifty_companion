import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'project_users_model.freezed.dart';
part 'project_users_model.g.dart';

@freezed
class ProjectUsersModel with _$ProjectUsersModel {
  const ProjectUsersModel._();

  @JsonSerializable(includeIfNull: false)
  const factory ProjectUsersModel({
    required int id,
    required String status,
    @JsonKey(name: 'final_mark') required int? finalMark,
    @JsonKey(name: 'validated?') required bool? isValidated,
    required ProjectModel project,
  }) = _ProjectUsersModel;

  factory ProjectUsersModel.fromJson(Map<String, Object?> json) =>
      _$ProjectUsersModelFromJson(json);
}

@freezed
class ProjectModel with _$ProjectModel {
  const ProjectModel._();

  @JsonSerializable(includeIfNull: false)
  const factory ProjectModel({
    required int id,
    required String name,
    required String slug,
    @JsonKey(name: 'parent_id') required int? parentId,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, Object?> json) =>
      _$ProjectModelFromJson(json);
}
