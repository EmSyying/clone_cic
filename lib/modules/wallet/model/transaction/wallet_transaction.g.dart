// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletTransaction _$$_WalletTransactionFromJson(Map<String, dynamic> json) =>
    _$_WalletTransaction(
      date: json['date'] as String?,
      transaction: (json['transaction'] as List<dynamic>?)
          ?.map((e) =>
              WalletTransactionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WalletTransactionToJson(
        _$_WalletTransaction instance) =>
    <String, dynamic>{
      'date': instance.date,
      'transaction': instance.transaction,
    };
