import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_transaction_detail.freezed.dart';
part 'wallet_transaction_detail.g.dart';

@freezed
class WalletTransactionDetail with _$WalletTransactionDetail {
  factory WalletTransactionDetail({
    @JsonKey(name: "id") final int? id,
    @JsonKey(name: "label") final String? label,
    @JsonKey(name: "amount") final String? amount,
    @JsonKey(name: "status") final String? status,
    @JsonKey(name: "remark") final String? remark,
    @JsonKey(name: "date") final String? date,
    @JsonKey(name: "time") final String? time,
    @JsonKey(name: "deposit_method") final String? depositMethod,
    @JsonKey(name: "bank_name") final String? bankName,
    @JsonKey(name: "transaction_type") final String? transactionType,
    final String? model,
    @JsonKey(name: "transaction_id") final String? transactionId,
    @JsonKey(name: "bank_account_number") final String? bankAccountNumber,
  }) = _WalletTransactionDetail;
  factory WalletTransactionDetail.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionDetailFromJson(json);
}
