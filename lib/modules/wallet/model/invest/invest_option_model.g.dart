// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invest_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InvestOptionModel _$$_InvestOptionModelFromJson(Map<String, dynamic> json) =>
    _$_InvestOptionModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      background: json['background'] as String?,
      details: (json['detail'] as List<dynamic>?)
          ?.map((e) => FiFDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_InvestOptionModelToJson(
        _$_InvestOptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'background': instance.background,
      'detail': instance.details,
    };
