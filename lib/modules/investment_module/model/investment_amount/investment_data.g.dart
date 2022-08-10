// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InvestmentDataModel _$$_InvestmentDataModelFromJson(
        Map<String, dynamic> json) =>
    _$_InvestmentDataModel(
      totalInvestment: json['total_investment'] as String?,
      aboutFif: json['about_fif'] as String?,
      currency: json['currency'] as String?,
      hide: json['hide'] as bool?,
    );

Map<String, dynamic> _$$_InvestmentDataModelToJson(
        _$_InvestmentDataModel instance) =>
    <String, dynamic>{
      'total_investment': instance.totalInvestment,
      'about_fif': instance.aboutFif,
      'currency': instance.currency,
      'hide': instance.hide,
    };
