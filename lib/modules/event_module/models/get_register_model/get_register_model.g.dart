// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetRegisterModel _$$_GetRegisterModelFromJson(Map<String, dynamic> json) =>
    _$_GetRegisterModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      event: json['event'] as String?,
      hostAt: json['host_at'] as String?,
      date: json['date'] as String?,
      fromTime: json['from_time'] as String?,
      toTime: json['to_time'] as String?,
      place: json['place'] as String?,
      location: json['location'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      livestreamLink: json['livestream_link'] as String?,
    );

Map<String, dynamic> _$$_GetRegisterModelToJson(_$_GetRegisterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'event': instance.event,
      'host_at': instance.hostAt,
      'date': instance.date,
      'from_time': instance.fromTime,
      'to_time': instance.toTime,
      'place': instance.place,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'livestream_link': instance.livestreamLink,
    };
