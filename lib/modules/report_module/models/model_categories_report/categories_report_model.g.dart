// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategorieReportModel _$$_CategorieReportModelFromJson(
        Map<String, dynamic> json) =>
    _$_CategorieReportModel(
      id: json['id'] as int?,
      category: json['category'] as String?,
      reportCount: json['report_count'] as int?,
      color: json['color'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$_CategorieReportModelToJson(
        _$_CategorieReportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'report_count': instance.reportCount,
      'color': instance.color,
      'icon': instance.icon,
    };
