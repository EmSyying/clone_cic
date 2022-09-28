// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fif_application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FiFApplicationDetailModel _$$_FiFApplicationDetailModelFromJson(
        Map<String, dynamic> json) =>
    _$_FiFApplicationDetailModel(
      code: json['code'] as String?,
      productId: json['product_id'] as int?,
      productCode: json['product_code'] as String?,
      subid: json['sub_product_id'] as int?,
      subproductName: json['sub_product_name'] as String?,
      subproductCode: json['sub_product_code'] as String?,
      accountName: json['account_name'] as String?,
      investmentAmount: json['investment_amount'] as String?,
      originalAmount: json['original_amount'] as num?,
      deductionAmount: json['deduction_amount'] as num?,
      totalInterestEarned: json['total_interest_earned'] as String?,
      monthlyInterestEarned: json['monthly_interest_earned'] as String?,
      productName: json['product_name'] as String?,
      annuallyInterestRate: json['annually_interest_rate'] as String?,
      investmentDate: json['investment_date'] as String?,
      firstPaymentDate: json['first_payment_date'] as String?,
      investmentAmountFormat: json['investment_amount_format'] as String?,
      maturityDate: json['maturity_date'] as String?,
      description: json['description'] as String?,
      duration: json['duration'] as String?,
      originalDuration: json['original_duration'] as num?,
      durationPeriod: json['duration_period'] as String?,
      paid: json['paid'] as num?,
      returnPaymenMethod: json['return_payment_method'] as String?,
      mmaAccountid: json['mma_account_id'] as num?,
      bankId: json['bank_id'] as num?,
      investorName: json['investor_name'] as String?,
      endMaturity: json['end_maturity'] as String?,
      currentPrincipal: json['current_principal'] as String?,
      interestType: json['interest_type'] as String?,
      allowWithdrawal: json['allow_withdrawal'] as String?,
      minimumWithdrawal: json['minimum_withdrawal'] as num?,
      withdrawalMessage: json['withdrawal_message'] as String?,
      paidFormat: json['paid_format'] as String?,
      bankType: json['bank_type'] == null
          ? null
          : BankType.fromJson(json['bank_type'] as Map<String, dynamic>),
      paymentProgressBar: json['payment_progress_bar'] as num?,
      currencyCode: json['currency_code'] as String?,
      originalCurrentPrincipal: json['original_current_principal'] as String?,
      autoRenewal: json['auto_renewal'] as String?,
      schedule: (json['schedule'] as List<dynamic>?)
          ?.map((e) => ScheduleModelList.fromJson(e as Map<String, dynamic>))
          .toList(),
      withdrawalNotice: (json['withdrawal_notice'] as List<dynamic>?)
          ?.map((e) => WithdrawNotice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FiFApplicationDetailModelToJson(
        _$_FiFApplicationDetailModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'product_id': instance.productId,
      'product_code': instance.productCode,
      'sub_product_id': instance.subid,
      'sub_product_name': instance.subproductName,
      'sub_product_code': instance.subproductCode,
      'account_name': instance.accountName,
      'investment_amount': instance.investmentAmount,
      'original_amount': instance.originalAmount,
      'deduction_amount': instance.deductionAmount,
      'total_interest_earned': instance.totalInterestEarned,
      'monthly_interest_earned': instance.monthlyInterestEarned,
      'product_name': instance.productName,
      'annually_interest_rate': instance.annuallyInterestRate,
      'investment_date': instance.investmentDate,
      'first_payment_date': instance.firstPaymentDate,
      'investment_amount_format': instance.investmentAmountFormat,
      'maturity_date': instance.maturityDate,
      'description': instance.description,
      'duration': instance.duration,
      'original_duration': instance.originalDuration,
      'duration_period': instance.durationPeriod,
      'paid': instance.paid,
      'return_payment_method': instance.returnPaymenMethod,
      'mma_account_id': instance.mmaAccountid,
      'bank_id': instance.bankId,
      'investor_name': instance.investorName,
      'end_maturity': instance.endMaturity,
      'current_principal': instance.currentPrincipal,
      'interest_type': instance.interestType,
      'allow_withdrawal': instance.allowWithdrawal,
      'minimum_withdrawal': instance.minimumWithdrawal,
      'withdrawal_message': instance.withdrawalMessage,
      'paid_format': instance.paidFormat,
      'bank_type': instance.bankType,
      'payment_progress_bar': instance.paymentProgressBar,
      'currency_code': instance.currencyCode,
      'original_current_principal': instance.originalCurrentPrincipal,
      'auto_renewal': instance.autoRenewal,
      'schedule': instance.schedule,
      'withdrawal_notice': instance.withdrawalNotice,
    };
