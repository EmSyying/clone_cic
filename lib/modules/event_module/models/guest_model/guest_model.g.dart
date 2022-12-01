// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GuestListModel _$$_GuestListModelFromJson(Map<String, dynamic> json) =>
    _$_GuestListModel(
      id: json['id'] as int?,
      participantName: json['participant_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      relationship: json['relationship'] as String?,
      isCheckBox: json['isCheckBox'] as bool? ?? false,
    );

Map<String, dynamic> _$$_GuestListModelToJson(_$_GuestListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participant_name': instance.participantName,
      'phone_number': instance.phoneNumber,
      'relationship': instance.relationship,
      'isCheckBox': instance.isCheckBox,
    };
