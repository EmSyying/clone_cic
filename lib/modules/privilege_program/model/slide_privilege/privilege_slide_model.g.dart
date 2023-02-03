// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privilege_slide_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PrivilegeSlideModel _$$_PrivilegeSlideModelFromJson(
        Map<String, dynamic> json) =>
    _$_PrivilegeSlideModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      module: json['module'] as String?,
      shopId: json['shop_id'] as int?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      destination: json['destination'] as String?,
      urlTarget: json['url_target'] as String?,
      image: json['image'] as String?,
      buttonList: json['button'] == null
          ? null
          : buttonListModel.fromJson(json['button'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PrivilegeSlideModelToJson(
        _$_PrivilegeSlideModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'module': instance.module,
      'shop_id': instance.shopId,
      'type': instance.type,
      'status': instance.status,
      'destination': instance.destination,
      'url_target': instance.urlTarget,
      'image': instance.image,
      'button': instance.buttonList,
    };
