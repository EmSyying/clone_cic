import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_summary.freezed.dart';
part 'payment_summary.g.dart';

@freezed
class PaymentSummary with _$PaymentSummary {
  factory PaymentSummary({
    @JsonKey(name: "success") final bool? success,
    @JsonKey(name: "message") final String? message,
    @JsonKey(name: "amount") final int? amount,
    @JsonKey(name: "original_amount") final int? originalAmount,
    @JsonKey(name: "shop_name") final String? shopName,
    @JsonKey(name: "transaction_id") final String? transactionId,
    @JsonKey(name: "date") final String? date,
    @JsonKey(name: "reference") final String? reference,
    @JsonKey(name: "from_account") final String? fromAccount,
    @JsonKey(name: "merchant_account") final String? merchantAccount,
    @JsonKey(name: "remark") final String? remark,
  }) = _PaymentSummary;

  factory PaymentSummary.fromJson(Map<String, dynamic> json) =>
      _$PaymentSummaryFromJson(json);
}
