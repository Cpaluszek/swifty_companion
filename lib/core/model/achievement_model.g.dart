// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AchievementModelImpl _$$AchievementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AchievementModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      tier: json['tier'] as String,
      image: json['image'] as String,
      nbrOfSuccess: (json['nbr_of_success'] as num?)?.toInt(),
      isVisible: json['isVisible'] as bool,
    );

Map<String, dynamic> _$$AchievementModelImplToJson(
    _$AchievementModelImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'description': instance.description,
    'tier': instance.tier,
    'image': instance.image,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nbr_of_success', instance.nbrOfSuccess);
  val['isVisible'] = instance.isVisible;
  return val;
}
