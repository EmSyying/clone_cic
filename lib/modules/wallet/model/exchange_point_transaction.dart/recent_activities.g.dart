// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_activities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecentActivities _$$_RecentActivitiesFromJson(Map<String, dynamic> json) =>
    _$_RecentActivities(
      id: json['id'] as int?,
      code: json['code'] as String?,
      label: json['label'] as String?,
      shopName: json['shop_name'] as String?,
      shopLogo: json['shop_logo'] as String?,
      description: json['description'] as String?,
      pointAmount: json['point_amount'] as num?,
      amount: json['amount'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$$_RecentActivitiesToJson(_$_RecentActivities instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'label': instance.label,
      'shop_name': instance.shopName,
      'shop_logo': instance.shopLogo,
      'description': instance.description,
      'point_amount': instance.pointAmount,
      'amount': instance.amount,
      'date': instance.date,
    };
