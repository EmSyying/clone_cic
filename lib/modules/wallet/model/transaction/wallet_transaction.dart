import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_transaction.freezed.dart';
part 'wallet_transaction.g.dart';

@freezed
class WalletTransaction with _$WalletTransaction {
  factory WalletTransaction({
    final int? id,
    final String? label,
    final String? status,
    final String? amount,
    final String? date,
    final String? time,
    @JsonKey(name: 'transaction_type') final String? transactionType,
  }) = _WalletTransaction;

  factory WalletTransaction.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionFromJson(json);
}
