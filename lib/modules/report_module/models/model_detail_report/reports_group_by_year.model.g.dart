// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_group_by_year.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportGroupByYearModel _$$_ReportGroupByYearModelFromJson(
        Map<String, dynamic> json) =>
    _$_ReportGroupByYearModel(
      id: json['id'] as int?,
      type: json['type'] as String?,
      category: json['category'] as String?,
      title: json['title'] as String?,
      shortDescription: json['short_description'] as String?,
      publishedAt: json['published_at'] as String?,
      color: json['color'] as String?,
      cover: json['cover'] as String?,
      attachedFile: json['attached_file'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_ReportGroupByYearModelToJson(
        _$_ReportGroupByYearModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'category': instance.category,
      'title': instance.title,
      'short_description': instance.shortDescription,
      'published_at': instance.publishedAt,
      'color': instance.color,
      'cover': instance.cover,
      'attached_file': instance.attachedFile,
      'url': instance.url,
    };
