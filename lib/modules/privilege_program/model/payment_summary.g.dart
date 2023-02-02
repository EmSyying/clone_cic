// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentSummary _$$_PaymentSummaryFromJson(Map<String, dynamic> json) =>
    _$_PaymentSummary(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      amount: json['amount'] as int?,
      originalAmount: json['original_amount'] as int?,
      shopName: json['shop_name'] as String?,
      transactionId: json['transaction_id'] as String?,
      date: json['date'] as String?,
      reference: json['reference'] as String?,
      fromAccount: json['from_account'] as String?,
      merchantAccount: json['merchant_account'] as String?,
      remark: json['remark'] as String?,
    );

Map<String, dynamic> _$$_PaymentSummaryToJson(_$_PaymentSummary instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'amount': instance.amount,
      'original_amount': instance.originalAmount,
      'shop_name': instance.shopName,
      'transaction_id': instance.transactionId,
      'date': instance.date,
      'reference': instance.reference,
      'from_account': instance.fromAccount,
      'merchant_account': instance.merchantAccount,
      'remark': instance.remark,
    };
