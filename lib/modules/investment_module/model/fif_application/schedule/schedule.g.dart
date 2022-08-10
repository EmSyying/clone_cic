// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScheduleModelList _$$_ScheduleModelListFromJson(Map<String, dynamic> json) =>
    _$_ScheduleModelList(
      titel: json['titel'] as String?,
      paymentDate: json['payment_date'] as String?,
      time: json['time'] as String?,
      interest: json['interest'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_ScheduleModelListToJson(
        _$_ScheduleModelList instance) =>
    <String, dynamic>{
      'titel': instance.titel,
      'payment_date': instance.paymentDate,
      'time': instance.time,
      'interest': instance.interest,
      'status': instance.status,
    };
