// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_guide_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AllGuideLine _$$_AllGuideLineFromJson(Map<String, dynamic> json) =>
    _$_AllGuideLine(
      bonus: (json['bonus'] as List<dynamic>?)
          ?.map((e) => GuideModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      directory: (json['directory'] as List<dynamic>?)
          ?.map((e) => GuideModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      investment: (json['investment'] as List<dynamic>?)
          ?.map((e) => GuideModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      report: (json['report'] as List<dynamic>?)
          ?.map((e) => GuideModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      trading: (json['ut_trading'] as List<dynamic>?)
          ?.map((e) => GuideModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AllGuideLineToJson(_$_AllGuideLine instance) =>
    <String, dynamic>{
      'bonus': instance.bonus,
      'directory': instance.directory,
      'investment': instance.investment,
      'report': instance.report,
      'ut_trading': instance.trading,
    };
