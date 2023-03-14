// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mvp_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MVPBalance _$$_MVPBalanceFromJson(Map<String, dynamic> json) =>
    _$_MVPBalance(
      mvpAmount: json['mvp_amount'] as num?,
      mvpWalletID: json['mvp_wallet_id'] as num?,
      mvpAmountFormat: json['mvp_amount_format'] as String?,
    );

Map<String, dynamic> _$$_MVPBalanceToJson(_$_MVPBalance instance) =>
    <String, dynamic>{
      'mvp_amount': instance.mvpAmount,
      'mvp_wallet_id': instance.mvpWalletID,
      'mvp_amount_format': instance.mvpAmountFormat,
    };
