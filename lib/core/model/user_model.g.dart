// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      login: json['login'] as String,
      displayName: json['displayname'] as String,
      email: json['email'] as String,
      location: json['location'] as String?,
      wallet: (json['wallet'] as num).toInt(),
      evaluationPoints: (json['correction_point'] as num).toInt(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) {
  final val = <String, dynamic>{
    'login': instance.login,
    'displayname': instance.displayName,
    'email': instance.email,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('location', instance.location);
  val['wallet'] = instance.wallet;
  val['correction_point'] = instance.evaluationPoints;
  return val;
}
