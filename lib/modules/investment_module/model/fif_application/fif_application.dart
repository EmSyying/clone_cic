// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'schedule/schedule.dart';
import 'withdraw_notice/bank_type.dart';
import 'withdraw_notice/withdraw_notice.dart';

part 'fif_application.freezed.dart';
part 'fif_application.g.dart';

@freezed
class FiFApplicationDetailModel with _$FiFApplicationDetailModel {
  factory FiFApplicationDetailModel({
    String? code,
    @JsonKey(name: 'product_id') int? productId,
    @JsonKey(name: 'product_code') String? productCode,
    @JsonKey(name: "sub_product_id") int? subid,
    @JsonKey(name: "sub_product_name") String? subproductName,
    @JsonKey(name: "sub_product_code") String? subproductCode,
    @JsonKey(name: 'account_name') String? accountName,
    @JsonKey(name: 'investment_amount') String? investmentAmount,
    @JsonKey(name: 'original_amount') num? originalAmount,
    @JsonKey(name: 'deduction_amount') num? deductionAmount,
    @JsonKey(name: 'total_interest_earned') String? totalInterestEarned,
    @JsonKey(name: 'monthly_interest_earned') String? monthlyInterestEarned,
    @JsonKey(name: 'product_name') String? productName,
    @JsonKey(name: 'annually_interest_rate') String? annuallyInterestRate,
    @JsonKey(name: 'investment_date') String? investmentDate,
    @JsonKey(name: 'first_payment_date') String? firstPaymentDate,
    @JsonKey(name: 'investment_amount_format') String? investmentAmountFormat,
    @JsonKey(name: 'maturity_date') String? maturityDate,
    String? description,
    String? duration,
    @JsonKey(name: 'original_duration') num? originalDuration,
    @JsonKey(name: 'duration_period') String? durationPeriod,
    num? paid,
    @JsonKey(name: 'return_payment_method') String? returnPaymenMethod,
    @JsonKey(name: 'mma_account_id') num? mmaAccountid,
    @JsonKey(name: 'bank_id') num? bankId,
    @JsonKey(name: 'investor_name') String? investorName,
    @JsonKey(name: 'end_maturity') String? endMaturity,
    @JsonKey(name: 'current_principal') String? currentPrincipal,
    @JsonKey(name: 'interest_type') String? interestType,
    @JsonKey(name: 'allow_withdrawal') String? allowWithdrawal,
    @JsonKey(name: 'minimum_withdrawal') num? minimumWithdrawal,
    @JsonKey(name: 'withdrawal_message') String? withdrawalMessage,
    @JsonKey(name: 'paid_format') String? paidFormat,
    @JsonKey(name: 'bank_type') BankType? bankType,
    @JsonKey(name: 'payment_progress_bar') num? paymentProgressBar,
    @JsonKey(name: 'currency_code') String? currencyCode,
    @JsonKey(name: 'original_current_principal')
        String? originalCurrentPrincipal,
    List<ScheduleModelList>? schedule,
    @JsonKey(name: 'withdrawal_notice') List<WithdrawNotice>? withdrawalNotice,
  }) = _FiFApplicationDetailModel;

  factory FiFApplicationDetailModel.fromJson(Map<String, dynamic> json) =>
      _$FiFApplicationDetailModelFromJson(json);
}
