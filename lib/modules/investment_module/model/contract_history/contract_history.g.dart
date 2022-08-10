// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContractHistory _$$_ContractHistoryFromJson(Map<String, dynamic> json) =>
    _$_ContractHistory(
      id: json['id'] as num?,
      accountName: json['account_name'] as String?,
      investmentAmount: json['investment_amount'] as String?,
      code: json['code'] as String?,
      hide: json['hide'] as bool?,
      color: json['color'] as String?,
      status: json['status'] as String?,
      firstPaymentDate: json['date'] as String?,
      originalAmount: json['original_amount'] as num?,
      returnPaymentMethod: json['return_payment_method'] as String?,
      mmaAccountId: json['mma_account_id'] as num?,
      bankId: json['bank_id'] as num?,
    );

Map<String, dynamic> _$$_ContractHistoryToJson(_$_ContractHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_name': instance.accountName,
      'investment_amount': instance.investmentAmount,
      'code': instance.code,
      'hide': instance.hide,
      'color': instance.color,
      'status': instance.status,
      'date': instance.firstPaymentDate,
      'original_amount': instance.originalAmount,
      'return_payment_method': instance.returnPaymentMethod,
      'mma_account_id': instance.mmaAccountId,
      'bank_id': instance.bankId,
    };
