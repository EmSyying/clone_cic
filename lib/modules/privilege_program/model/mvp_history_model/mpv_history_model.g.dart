// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mpv_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MVPHistoryModel _$$_MVPHistoryModelFromJson(Map<String, dynamic> json) =>
    _$_MVPHistoryModel(
      id: json['id'] as int?,
      refId: json['ref_id'] as String?,
      description: json['description'] as String?,
      transactionType: json['transaction_type'] as String?,
      amount: json['amount'] as String?,
      paymentDate: json['payment_date'] as String?,
    );

Map<String, dynamic> _$$_MVPHistoryModelToJson(_$_MVPHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ref_id': instance.refId,
      'description': instance.description,
      'transaction_type': instance.transactionType,
      'amount': instance.amount,
      'payment_date': instance.paymentDate,
    };
