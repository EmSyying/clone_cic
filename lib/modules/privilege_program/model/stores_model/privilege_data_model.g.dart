// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privilege_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PrivilegeDataModel _$$_PrivilegeDataModelFromJson(
        Map<String, dynamic> json) =>
    _$_PrivilegeDataModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PrivilegeShopModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PrivilegeDataModelToJson(
        _$_PrivilegeDataModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };
