// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_history_privilege.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PrivilegeHistoryModel _$$_PrivilegeHistoryModelFromJson(
        Map<String, dynamic> json) =>
    _$_PrivilegeHistoryModel(
      id: json['id'] as int?,
      thumbnail: json['thumbnail'] as String?,
      shopName: json['shop_name'] as String?,
      code: json['code'] as String?,
      amount: json['amount'] as String?,
      paymentDate: json['payment_date'] as String?,
    );

Map<String, dynamic> _$$_PrivilegeHistoryModelToJson(
        _$_PrivilegeHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'thumbnail': instance.thumbnail,
      'shop_name': instance.shopName,
      'code': instance.code,
      'amount': instance.amount,
      'payment_date': instance.paymentDate,
    };
