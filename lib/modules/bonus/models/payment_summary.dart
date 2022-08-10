class PaymentSummary {
  num? amountPaidToCic;
  num? totalSubscriptionCost;
  num? availableBalanceDeducted;
  String? lastDateOfPayment;

  PaymentSummary(
      {this.amountPaidToCic,
      this.totalSubscriptionCost,
      this.availableBalanceDeducted,
      this.lastDateOfPayment});

  PaymentSummary.fromJson(Map<String, dynamic> json) {
    amountPaidToCic = json['amount_paid_to_cic'];
    totalSubscriptionCost = json['total_subscription_cost'];
    availableBalanceDeducted = json['available_balance_deducted'];
    lastDateOfPayment = json['last_date_of_payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount_paid_to_cic'] = amountPaidToCic;
    data['total_subscription_cost'] = totalSubscriptionCost;
    data['available_balance_deducted'] = availableBalanceDeducted;
    data['last_date_of_payment'] = lastDateOfPayment;
    return data;
  }
}
