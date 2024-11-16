import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:swifty_companion/core/model/cursus_users_model.dart';
import 'package:swifty_companion/core/model/image_model.dart';

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
    @JsonKey(name: 'cursus_users') required List<CursusUsersModel> cursusUsers,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}

/*
"id": 132111,
I/flutter ( 4795): ║         "email": "cpalusze@student.42lyon.fr",
I/flutter ( 4795): ║         "login": "cpalusze",
I/flutter ( 4795): ║         "first_name": "Clément",
I/flutter ( 4795): ║         "last_name": "Paluszek",
I/flutter ( 4795): ║         "usual_full_name": "Clément Paluszek",
I/flutter ( 4795): ║         "usual_first_name": null,
I/flutter ( 4795): ║         "url": "https://api.intra.42.fr/v2/users/cpalusze",
I/flutter ( 4795): ║         "phone": "hidden",
I/flutter ( 4795): ║         "displayname": "Clément Paluszek",
I/flutter ( 4795): ║         "kind": "student",
 */
