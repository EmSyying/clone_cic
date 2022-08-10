// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equity_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EquitySetting _$$_EquitySettingFromJson(Map<String, dynamic> json) =>
    _$_EquitySetting(
      minEquityAmount: json['min_equity_amount'] as int?,
      maxEquityAmount: json['max_equity_amount'] as int?,
      message: json['equity_message'] as String?,
    );

Map<String, dynamic> _$$_EquitySettingToJson(_$_EquitySetting instance) =>
    <String, dynamic>{
      'min_equity_amount': instance.minEquityAmount,
      'max_equity_amount': instance.maxEquityAmount,
      'equity_message': instance.message,
    };
