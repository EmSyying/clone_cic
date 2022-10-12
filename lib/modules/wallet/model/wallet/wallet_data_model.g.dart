// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletDataModel _$$_WalletDataModelFromJson(Map<String, dynamic> json) =>
    _$_WalletDataModel(
      wallet: json['wallet'] == null
          ? null
          : WalletAmountModel.fromJson(json['wallet'] as Map<String, dynamic>),
      invester: json['invester'] == null
          ? null
          : InvesterModel.fromJson(json['invester'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_WalletDataModelToJson(_$_WalletDataModel instance) =>
    <String, dynamic>{
      'wallet': instance.wallet,
      'invester': instance.invester,
    };
