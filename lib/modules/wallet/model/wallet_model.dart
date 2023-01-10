import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
class WalletAmountModel with _$WalletAmountModel {
  factory WalletAmountModel({
    @JsonKey(name: 'balance') num? balance,
    @JsonKey(name: 'balance_format') String? balanceFormat,
    @JsonKey(name: 'account_id') int? accountId,
    @JsonKey(name: 'account_number') String? accountNumber,
  }) = _WalletAmountModel;

  factory WalletAmountModel.fromJson(Map<String, dynamic> json) =>
      _$WalletAmountModelFromJson(json);
}
