// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_check_in_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CheckInModel _$$_CheckInModelFromJson(Map<String, dynamic> json) =>
    _$_CheckInModel(
      id: json['id'] as int?,
      value: json['value'] as String?,
      display: json['display'] as String?,
      event: json['event'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      isCicMember: json['is_cic_member'] as bool?,
      participantName: json['participant_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      referralMember: json['referral_member'] as String?,
      checkIn: json['check_in'] as bool?,
      checkInDate: json['check_in_date'] as String?,
    );

Map<String, dynamic> _$$_CheckInModelToJson(_$_CheckInModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'display': instance.display,
      'event': instance.event,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'is_cic_member': instance.isCicMember,
      'participant_name': instance.participantName,
      'phone_number': instance.phoneNumber,
      'referral_member': instance.referralMember,
      'check_in': instance.checkIn,
      'check_in_date': instance.checkInDate,
    };
