class PaidInfo {
  String? status;
  String? reason;
  String? date;
  String? bankName;
  String? bankLogo;
  String? image;
  String? amount;
  bool? isMobile;

  PaidInfo(
      {this.status,
      this.reason,
      this.date,
      this.bankName,
      this.bankLogo,
      this.image,
      this.amount,
      this.isMobile});

  PaidInfo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
    date = json['date'];
    bankName = json['bank_name'];
    bankLogo = json['bank_logo'];
    image = json['image'];
    amount = json['amount'];
    isMobile = json['isMobile'] ?? true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['reason'] = reason;
    data['date'] = date;
    data['bank_name'] = bankName;
    data['bank_logo'] = bankLogo;
    data['image'] = image;
    data['amount'] = amount;
    return data;
  }
}
