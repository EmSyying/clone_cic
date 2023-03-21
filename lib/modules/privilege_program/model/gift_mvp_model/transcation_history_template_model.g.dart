// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcation_history_template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionHisotryTemplateModel _$$_TransactionHisotryTemplateModelFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionHisotryTemplateModel(
      id: json['id'] as int?,
      templateName: json['template_name'] as String?,
      walletNumber: json['wallet_number'] as String?,
      image: json['image'] as String?,
      defaultImage: json['default_image'] as String?,
      walletName: json['wallet_name'] as String?,
      amount: json['amount'] as String?,
      paymentDate: json['payment_date'] as String?,
    );

Map<String, dynamic> _$$_TransactionHisotryTemplateModelToJson(
        _$_TransactionHisotryTemplateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'template_name': instance.templateName,
      'wallet_number': instance.walletNumber,
      'image': instance.image,
      'default_image': instance.defaultImage,
      'wallet_name': instance.walletName,
      'amount': instance.amount,
      'payment_date': instance.paymentDate,
    };
