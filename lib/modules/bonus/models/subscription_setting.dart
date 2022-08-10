class BonusSetting {
  String? cashOutSendingDate;
  num? minimumCashOutAmount;
  num? minUtSubscription;
  bool? isCicTeam;
  String? serviceAgreement;

  BonusSetting(
      {this.cashOutSendingDate,
      this.minimumCashOutAmount,
      this.minUtSubscription,
      this.isCicTeam,
      this.serviceAgreement});

  BonusSetting.fromJson(Map<String, dynamic> json) {
    cashOutSendingDate = json['cash_out_sending_date'];
    minimumCashOutAmount = json['minimum_cash_out_amount'];
    minUtSubscription = json['min_ut_subscription'];
    isCicTeam = json['is_cic_team'];
    serviceAgreement = json['service_agreement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cash_out_sending_date'] = cashOutSendingDate;
    data['minimum_cash_out_amount'] = minimumCashOutAmount;
    data['min_ut_subscription'] = minUtSubscription;
    data['is_cic_team'] = isCicTeam;
    data['service_agreement'] = serviceAgreement;
    return data;
  }
}
