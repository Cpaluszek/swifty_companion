// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageModelImpl _$$ImageModelImplFromJson(Map<String, dynamic> json) =>
    _$ImageModelImpl(
      link: json['link'] as String,
      versions:
          ImageVersions.fromJson(json['versions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ImageModelImplToJson(_$ImageModelImpl instance) =>
    <String, dynamic>{
      'link': instance.link,
      'versions': instance.versions,
    };

_$ImageVersionsImpl _$$ImageVersionsImplFromJson(Map<String, dynamic> json) =>
    _$ImageVersionsImpl(
      large: json['large'] as String,
      medium: json['medium'] as String,
      small: json['small'] as String,
      micro: json['micro'] as String,
    );

Map<String, dynamic> _$$ImageVersionsImplToJson(_$ImageVersionsImpl instance) =>
    <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
      'micro': instance.micro,
    };
