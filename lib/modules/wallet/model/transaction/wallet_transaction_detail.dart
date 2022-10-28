import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_transaction_detail.freezed.dart';
part 'wallet_transaction_detail.g.dart';

@freezed
class WalletTransactionDetail with _$WalletTransactionDetail {
  factory WalletTransactionDetail(
          {final int? id,
          final String? label,
          final String? amount,
          final String? date,
          final String? time,
          @JsonKey(name: 'deposit_method') final String? depositMethod,
          final String? remark,
          @JsonKey(name: 'transaction_type') final String? transactionType,
          @JsonKey(name: 'transaction_id') final String? transactionId}) =
      _WalletTransactionDetail;

  factory WalletTransactionDetail.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionDetailFromJson(json);
}
