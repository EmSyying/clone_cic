// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guide_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GuideModel _$$_GuideModelFromJson(Map<String, dynamic> json) =>
    _$_GuideModel(
      id: json['id'] as int?,
      title: json['title_en'] as String?,
      titleKh: json['title_kh'] as String?,
      description: json['content_en'] as String?,
      contentKh: json['content_kh'] as String?,
      key: json['key'],
    );

Map<String, dynamic> _$$_GuideModelToJson(_$_GuideModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title_en': instance.title,
      'title_kh': instance.titleKh,
      'content_en': instance.description,
      'content_kh': instance.contentKh,
      'key': instance.key,
    };
