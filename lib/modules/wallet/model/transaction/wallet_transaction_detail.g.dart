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
      remark: json['remark'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      depositMethod: json['deposit_method'] as String?,
      bankName: json['bank_name'] as String?,
      transactionType: json['transaction_type'] as String?,
      transactionId: json['transaction_id'] as String?,
      bankAccountNumber: json['bank_account_number'] as String?,
    );

Map<String, dynamic> _$$_WalletTransactionDetailToJson(
        _$_WalletTransactionDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'amount': instance.amount,
      'status': instance.status,
      'remark': instance.remark,
      'date': instance.date,
      'time': instance.time,
      'deposit_method': instance.depositMethod,
      'bank_name': instance.bankName,
      'transaction_type': instance.transactionType,
      'transaction_id': instance.transactionId,
      'bank_account_number': instance.bankAccountNumber,
    };
