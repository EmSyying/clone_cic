import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_history.freezed.dart';
part 'contract_history.g.dart';

@freezed
class ContractHistory with _$ContractHistory {
  factory ContractHistory({
    num? id,
    @JsonKey(name: 'account_name') String? accountName,
    @JsonKey(name: 'investment_amount') String? investmentAmount,
    String? code,
    bool? hide,
    String? color,
    String? status,
    @JsonKey(name: 'date') String? firstPaymentDate,
    @JsonKey(name: 'original_amount') num? originalAmount,
    @JsonKey(name: 'return_payment_method') String? returnPaymentMethod,
    @JsonKey(name: 'mma_account_id') num? mmaAccountId,
    @JsonKey(name: 'bank_id') num? bankId,
  }) = _ContractHistory;

  factory ContractHistory.fromJson(Map<String, dynamic> json) =>
      _$ContractHistoryFromJson(json);
}
