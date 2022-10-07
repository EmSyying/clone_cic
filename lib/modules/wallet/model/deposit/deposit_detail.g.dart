// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DepositDetail _$$_DepositDetailFromJson(Map<String, dynamic> json) =>
    _$_DepositDetail(
      id: json['id'] as int?,
      title: json['title'] as String?,
      transactionId: json['transaction_id'] as String?,
      depositMethod: json['deposit_method'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      amount: json['amount'] as String?,
    );

Map<String, dynamic> _$$_DepositDetailToJson(_$_DepositDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'transaction_id': instance.transactionId,
      'deposit_method': instance.depositMethod,
      'date': instance.date,
      'time': instance.time,
      'amount': instance.amount,
    };
