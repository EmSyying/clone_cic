import 'package:cicgreenloan/modules/wallet/model/transaction/wallet_transaction_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_transaction.freezed.dart';
part 'wallet_transaction.g.dart';

@freezed
class WalletTransaction with _$WalletTransaction {
  factory WalletTransaction(
      {final String? date,
      final List<WalletTransactionDetail>? transaction}) = _WalletTransaction;

  factory WalletTransaction.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionFromJson(json);
}
