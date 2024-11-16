import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'image_model.freezed.dart';
part 'image_model.g.dart';

@freezed
class ImageModel with _$ImageModel {
  const ImageModel._();

  @JsonSerializable(includeIfNull: false)
  const factory ImageModel({
    required String link,
    required ImageVersions versions,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, Object?> json) =>
      _$ImageModelFromJson(json);
}

@freezed
class ImageVersions with _$ImageVersions {
  const ImageVersions._();

  @JsonSerializable(includeIfNull: false)
  const factory ImageVersions({
    required String large,
    required String medium,
    required String small,
    required String micro,
  }) = _ImageVersions;

  factory ImageVersions.fromJson(Map<String, Object?> json) =>
      _$ImageVersionsFromJson(json);
}
