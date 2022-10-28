// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletTransaction _$$_WalletTransactionFromJson(Map<String, dynamic> json) =>
    _$_WalletTransaction(
      id: json['id'] as int?,
      label: json['label'] as String?,
      status: json['status'] as String?,
      amount: json['amount'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      transactionType: json['transaction_type'] as String?,
    );

Map<String, dynamic> _$$_WalletTransactionToJson(
        _$_WalletTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'status': instance.status,
      'amount': instance.amount,
      'date': instance.date,
      'time': instance.time,
      'transaction_type': instance.transactionType,
    };
