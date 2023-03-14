import 'package:freezed_annotation/freezed_annotation.dart';

part 'mvp_balance.freezed.dart';
part 'mvp_balance.g.dart';

@freezed
class MVPBalance with _$MVPBalance {
  factory MVPBalance({
    @JsonKey(name: 'mvp_amount') final num? mvpAmount,
    @JsonKey(name: 'mvp_wallet_id') final num? mvpWalletID,
    @JsonKey(name: 'mvp_amount_format') final String? mvpAmountFormat,
  }) = _MVPBalance;

  factory MVPBalance.fromJson(Map<String, dynamic> json) =>
      _$MVPBalanceFromJson(json);
}
