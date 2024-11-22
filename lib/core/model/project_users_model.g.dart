// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectUsersModelImpl _$$ProjectUsersModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectUsersModelImpl(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String,
      finalMark: (json['final_mark'] as num?)?.toInt(),
      isValidated: json['validated?'] as bool?,
      project: ProjectModel.fromJson(json['project'] as Map<String, dynamic>),
      cursusIds: (json['cursus_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$ProjectUsersModelImplToJson(
    _$ProjectUsersModelImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': instance.status,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('final_mark', instance.finalMark);
  writeNotNull('validated?', instance.isValidated);
  val['project'] = instance.project;
  val['cursus_ids'] = instance.cursusIds;
  return val;
}

_$ProjectModelImpl _$$ProjectModelImplFromJson(Map<String, dynamic> json) =>
    _$ProjectModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      parentId: (json['parent_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProjectModelImplToJson(_$ProjectModelImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'slug': instance.slug,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parent_id', instance.parentId);
  return val;
}
