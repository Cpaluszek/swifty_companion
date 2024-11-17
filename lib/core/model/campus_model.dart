import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'campus_model.freezed.dart';
part 'campus_model.g.dart';

@freezed
class CampusModel with _$CampusModel {
  const CampusModel._();

  @JsonSerializable(includeIfNull: false)
  const factory CampusModel({
    required int id,
    required String name,
  }) = _CampusModel;

  factory CampusModel.fromJson(Map<String, Object?> json) => _$CampusModelFromJson(json);
}
