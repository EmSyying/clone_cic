// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_transaction_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletTransactionDetail _$$_WalletTransactionDetailFromJson(
        Map<String, dynamic> json) =>
    _$_WalletTransactionDetail(
      id: json['id'] as int?,
      label: json['label'] as String?,
      amount: json['amount'] as String?,
      status: json['status'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      depositMethod: json['deposit_method'] as String?,
      remark: json['remark'] as String?,
      transactionType: json['transaction_type'] as String?,
      bnakAccountNumber: json['bank_account_nummber'] as String?,
      bankName: json['bank_name'] as String?,
      transactionId: json['transaction_id'] as String?,
    );

Map<String, dynamic> _$$_WalletTransactionDetailToJson(
        _$_WalletTransactionDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'amount': instance.amount,
      'status': instance.status,
      'date': instance.date,
      'time': instance.time,
      'deposit_method': instance.depositMethod,
      'remark': instance.remark,
      'transaction_type': instance.transactionType,
      'bank_account_nummber': instance.bnakAccountNumber,
      'bank_name': instance.bankName,
      'transaction_id': instance.transactionId,
    };
