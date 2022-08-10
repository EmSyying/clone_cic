class ShareSubscriptionByPrices {
  num? numberShare;
  num? price;

  ShareSubscriptionByPrices({this.numberShare, this.price});

  ShareSubscriptionByPrices.fromJson(Map<String, dynamic> json) {
    numberShare = json['number_share'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number_share'] = numberShare;
    data['price'] = price;
    return data;
  }
}
