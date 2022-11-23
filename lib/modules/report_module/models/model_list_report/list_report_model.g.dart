// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListReportModel _$$_ListReportModelFromJson(Map<String, dynamic> json) =>
    _$_ListReportModel(
      date: json['date'] as int?,
      reports: (json['reports'] as List<dynamic>?)
          ?.map(
              (e) => ReportGroupByYearModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListReportModelToJson(_$_ListReportModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'reports': instance.reports,
    };
