// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_mvp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewMvpSuccessModel _$$_ReviewMvpSuccessModelFromJson(
        Map<String, dynamic> json) =>
    _$_ReviewMvpSuccessModel(
      message: json['message'] as String?,
      amount: json['amount'] as String?,
      originalAmount: json['original_amount'] as String?,
      toAccountName: json['to_account_name'] as String?,
      transactionId: json['transaction_id'] as String?,
      date: json['date'] as String?,
      reference: json['reference'] as String?,
      fromAccountName: json['from_account_name'] as String?,
      remark: json['remark'] as String?,
    );

Map<String, dynamic> _$$_ReviewMvpSuccessModelToJson(
        _$_ReviewMvpSuccessModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'amount': instance.amount,
      'original_amount': instance.originalAmount,
      'to_account_name': instance.toAccountName,
      'transaction_id': instance.transactionId,
      'date': instance.date,
      'reference': instance.reference,
      'from_account_name': instance.fromAccountName,
      'remark': instance.remark,
    };
