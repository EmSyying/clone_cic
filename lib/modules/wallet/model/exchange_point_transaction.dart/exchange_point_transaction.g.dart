// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_point_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExchangePointTransaction _$$_ExchangePointTransactionFromJson(
        Map<String, dynamic> json) =>
    _$_ExchangePointTransaction(
      id: json['id'] as int?,
      description: json['description'] as String?,
      amount: json['amount'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$$_ExchangePointTransactionToJson(
        _$_ExchangePointTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'amount': instance.amount,
      'date': instance.date,
    };
