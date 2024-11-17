// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursus_users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CursusUsersModelImpl _$$CursusUsersModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CursusUsersModelImpl(
      id: (json['id'] as num).toInt(),
      cursusId: (json['cursus_id'] as num).toInt(),
      grade: json['grade'] as String?,
      level: (json['level'] as num).toDouble(),
      skills: (json['skills'] as List<dynamic>)
          .map((e) => SkillModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      cursus: CursusModel.fromJson(json['cursus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CursusUsersModelImplToJson(
    _$CursusUsersModelImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'cursus_id': instance.cursusId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('grade', instance.grade);
  val['level'] = instance.level;
  val['skills'] = instance.skills;
  val['cursus'] = instance.cursus;
  return val;
}

_$CursusModelImpl _$$CursusModelImplFromJson(Map<String, dynamic> json) =>
    _$CursusModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      kind: json['kind'] as String,
    );

Map<String, dynamic> _$$CursusModelImplToJson(_$CursusModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'kind': instance.kind,
    };
