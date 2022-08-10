// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentData _$$_PaymentDataFromJson(Map<String, dynamic> json) =>
    _$_PaymentData(
      id: json['id'] as num?,
      type: json['type'] as String?,
      bankName: json['bank_name'] as String?,
      accounName: json['account_name'] as String?,
      accountNumber: json['account_number'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_PaymentDataToJson(_$_PaymentData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'bank_name': instance.bankName,
      'account_name': instance.accounName,
      'account_number': instance.accountNumber,
      'image': instance.image,
    };
