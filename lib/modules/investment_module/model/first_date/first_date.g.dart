// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'first_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FIFApplicationListModel _$$_FIFApplicationListModelFromJson(
        Map<String, dynamic> json) =>
    _$_FIFApplicationListModel(
      id: json['id'] as num?,
      code: json['code'] as String?,
      color: json['color'] as String?,
      accountName: json['account_name'] as String?,
      investmentAmount: json['investment_amount'] as String?,
      firstPaymentDate: json['first_payment_date'] as String?,
      hide: json['hide'] as bool?,
      status: json['status'] as String?,
      returnPaymentMethod: json['return_payment_method'] as String?,
      mmaAccountId: json['mma_account_id'] as num?,
      bankId: json['bank_id'] as num?,
    );

Map<String, dynamic> _$$_FIFApplicationListModelToJson(
        _$_FIFApplicationListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'color': instance.color,
      'account_name': instance.accountName,
      'investment_amount': instance.investmentAmount,
      'first_payment_date': instance.firstPaymentDate,
      'hide': instance.hide,
      'status': instance.status,
      'return_payment_method': instance.returnPaymentMethod,
      'mma_account_id': instance.mmaAccountId,
      'bank_id': instance.bankId,
    };
