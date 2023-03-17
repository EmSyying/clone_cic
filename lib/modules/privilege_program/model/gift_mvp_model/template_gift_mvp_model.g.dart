// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_gift_mvp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TemplateGiftMVPModel _$$_TemplateGiftMVPModelFromJson(
        Map<String, dynamic> json) =>
    _$_TemplateGiftMVPModel(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      name: json['name'] as String?,
      walletNumber: json['wallet_number'] as String?,
      typeCode: json['type_code'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$_TemplateGiftMVPModelToJson(
        _$_TemplateGiftMVPModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'wallet_number': instance.walletNumber,
      'type_code': instance.typeCode,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
