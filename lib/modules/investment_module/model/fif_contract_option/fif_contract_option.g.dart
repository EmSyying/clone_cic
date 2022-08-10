// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fif_contract_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FIFoptionModel _$$_FIFoptionModelFromJson(Map<String, dynamic> json) =>
    _$_FIFoptionModel(
      id: json['id'] as int?,
      productName: json['product_name'] as String?,
      productCode: json['product_code'] as String?,
      subid: json['sub_product_id'] as int?,
      subproductName: json['sub_product_name'] as String?,
      subproductCode: json['sub_product_code'] as String?,
      annuallyInterestRate: json['annually_interest_rate'] as String?,
      description: json['description'] as String?,
      urlWebview: json['url_webview'] as String?,
      investmentMinimum: json['investment_minimum'] as num?,
      investmentDefault: json['investment_default'] as num?,
      investmentMaximum: json['investment_maximum'] as num?,
      investmentMessage: json['investment_message'] as String?,
      durationMinimum: json['duration_minimum'] as num?,
      durationDefault: json['duration_default'] as num?,
      durationMaximum: json['duration_maximum'] as num?,
      durationMessage: json['duration_message'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => FIFoptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FIFoptionModelToJson(_$_FIFoptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'product_code': instance.productCode,
      'sub_product_id': instance.subid,
      'sub_product_name': instance.subproductName,
      'sub_product_code': instance.subproductCode,
      'annually_interest_rate': instance.annuallyInterestRate,
      'description': instance.description,
      'url_webview': instance.urlWebview,
      'investment_minimum': instance.investmentMinimum,
      'investment_default': instance.investmentDefault,
      'investment_maximum': instance.investmentMaximum,
      'investment_message': instance.investmentMessage,
      'duration_minimum': instance.durationMinimum,
      'duration_default': instance.durationDefault,
      'duration_maximum': instance.durationMaximum,
      'duration_message': instance.durationMessage,
      'options': instance.options,
    };
