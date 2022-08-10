// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'principal_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PrincipalHistory _$$_PrincipalHistoryFromJson(Map<String, dynamic> json) =>
    _$_PrincipalHistory(
      type: json['type'] as String?,
      label: json['label'] as String?,
      date: json['date'] as String?,
      colorCode: json['color_code'] as String?,
      investmentAmount: json['investment_amount'] as String?,
    );

Map<String, dynamic> _$$_PrincipalHistoryToJson(_$_PrincipalHistory instance) =>
    <String, dynamic>{
      'type': instance.type,
      'label': instance.label,
      'date': instance.date,
      'color_code': instance.colorCode,
      'investment_amount': instance.investmentAmount,
    };
