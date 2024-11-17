// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      login: json['login'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      url: json['url'] as String,
      phone: json['phone'] as String,
      kind: json['kind'] as String,
      displayName: json['displayname'] as String,
      location: json['location'] as String?,
      wallet: (json['wallet'] as num).toInt(),
      evaluationPoints: (json['correction_point'] as num).toInt(),
      image: ImageModel.fromJson(json['image'] as Map<String, dynamic>),
      poolMonth: json['pool_month'] as String,
      poolYear: json['pool_year'] as String,
      isAlumni: json['alumni?'] as bool,
      isActive: json['active?'] as bool,
      campus: (json['campus'] as List<dynamic>)
          .map((e) => CampusModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      cursusUsers: (json['cursus_users'] as List<dynamic>)
          .map((e) => CursusUsersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      achievements: (json['achievements'] as List<dynamic>)
          .map((e) => AchievementModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'email': instance.email,
    'login': instance.login,
    'first_name': instance.firstName,
    'last_name': instance.lastName,
    'url': instance.url,
    'phone': instance.phone,
    'kind': instance.kind,
    'displayname': instance.displayName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('location', instance.location);
  val['wallet'] = instance.wallet;
  val['correction_point'] = instance.evaluationPoints;
  val['image'] = instance.image;
  val['pool_month'] = instance.poolMonth;
  val['pool_year'] = instance.poolYear;
  val['alumni?'] = instance.isAlumni;
  val['active?'] = instance.isActive;
  val['campus'] = instance.campus;
  val['cursus_users'] = instance.cursusUsers;
  val['achievements'] = instance.achievements;
  return val;
}
