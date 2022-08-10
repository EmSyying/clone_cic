class Details {
  String? receiptNumber;
  String? tradingDate;
  num? avgSharePrice;
  num? shareRequested;
  num? shareTraded;
  List<PayOffSlip>? sharePriceBreakdown;
  List<PayOffSlip>? payOffSlip;
  List<Bank>? bank;

  Details(
      {this.receiptNumber,
      this.tradingDate,
      this.avgSharePrice,
      this.shareRequested,
      this.shareTraded,
      this.sharePriceBreakdown,
      this.payOffSlip,
      this.bank});

  Details.fromJson(Map<String, dynamic> json) {
    receiptNumber = json['receipt_number'];
    tradingDate = json['trading_date'];
    avgSharePrice = json['avg_share_price'];
    shareRequested = json['share_requested'];
    shareTraded = json['share_traded'];
    if (json['share_price_breakdown'] != null) {
      sharePriceBreakdown = [];
      json['share_price_breakdown'].forEach((v) {
        sharePriceBreakdown!.add(PayOffSlip.fromJson(v));
      });
    }
    if (json['pay_off_slip'] != null) {
      payOffSlip = [];
      json['pay_off_slip'].forEach((v) {
        payOffSlip!.add(PayOffSlip.fromJson(v));
      });
    }
    if (json['bank'] != null) {
      bank = [];
      json['bank'].forEach((v) {
        bank!.add(Bank.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['receipt_number'] = receiptNumber;
    data['trading_date'] = tradingDate;
    data['avg_share_price'] = avgSharePrice;
    data['share_requested'] = shareRequested;
    data['share_traded'] = shareTraded;
    if (sharePriceBreakdown != null) {
      data['share_price_breakdown'] =
          sharePriceBreakdown!.map((v) => v.toJson()).toList();
    }
    if (payOffSlip != null) {
      data['pay_off_slip'] = payOffSlip!.map((v) => v.toJson()).toList();
    }
    if (bank != null) {
      data['bank'] = bank!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bank {
  num? id;
  String? bankName;
  String? accountName;
  String? accountNumber;
  num? isBank;
  String? color;
  String? image;
  String? transferenceImage;
  String? contactName;
  String? contactNumber;
  String? address;
  String? description;

  Bank(
      {this.id,
      this.bankName,
      this.accountName,
      this.accountNumber,
      this.isBank,
      this.color,
      this.image,
      this.transferenceImage,
      this.contactName,
      this.contactNumber,
      this.address,
      this.description});

  Bank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankName = json['bank_name'];
    accountName = json['account_name'];
    accountNumber = json['account_number'];
    isBank = json['is_bank'];
    color = json['color'];
    image = json['image'];
    transferenceImage = json['transference_image'];
    contactName = json['contact_name'];
    contactNumber = json['contact_number'];
    address = json['address'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bank_name'] = bankName;
    data['account_name'] = accountName;
    data['account_number'] = accountNumber;
    data['is_bank'] = isBank;
    data['color'] = color;
    data['image'] = image;
    data['transference_image'] = transferenceImage;
    data['contact_name'] = contactName;
    data['contact_number'] = contactNumber;
    data['address'] = address;
    data['description'] = description;
    return data;
  }
}

class PayOffSlip {
  num? quantity;
  num? price;
  num? total;

  PayOffSlip({this.quantity, this.price, this.total});

  PayOffSlip.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    price = json['price'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quantity'] = quantity;
    data['price'] = price;
    data['total'] = total;
    return data;
  }
}
