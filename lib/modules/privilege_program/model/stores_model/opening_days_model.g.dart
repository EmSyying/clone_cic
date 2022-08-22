// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_days_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OpeningDaysModel _$$_OpeningDaysModelFromJson(Map<String, dynamic> json) =>
    _$_OpeningDaysModel(
      dayName: json['day_name'] as String?,
      shiftAHours: json['shift_a_hours'] as String?,
      shiftBHours: json['shift_b_hours'] as String?,
    );

Map<String, dynamic> _$$_OpeningDaysModelToJson(_$_OpeningDaysModel instance) =>
    <String, dynamic>{
      'day_name': instance.dayName,
      'shift_a_hours': instance.shiftAHours,
      'shift_b_hours': instance.shiftBHours,
    };
