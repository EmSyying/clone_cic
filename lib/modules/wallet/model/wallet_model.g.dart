// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletAmountModel _$$_WalletAmountModelFromJson(Map<String, dynamic> json) =>
    _$_WalletAmountModel(
      balance: json['balance'] as num?,
      balanceFormat: json['balance_format'] as String?,
      accountId: json['account_id'] as int?,
      accountNumber: json['account_number'] as String?,
    );

Map<String, dynamic> _$$_WalletAmountModelToJson(
        _$_WalletAmountModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'balance_format': instance.balanceFormat,
      'account_id': instance.accountId,
      'account_number': instance.accountNumber,
    };
