class LastTradingCardModel {
  TradingCardData? data;

  LastTradingCardModel({this.data});

  LastTradingCardModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? TradingCardData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class TradingCardData {
  num? maxBid;
  num? numberOfBuyers;
  num? utBought;
  num? maxPrice;
  num? minPrice;
  num? utMatched;
  num? minAsk;
  num? numberOfSellers;
  num? utSold;

  TradingCardData(
      {this.maxBid,
      this.numberOfBuyers,
      this.utBought,
      this.maxPrice,
      this.minPrice,
      this.utMatched,
      this.minAsk,
      this.numberOfSellers,
      this.utSold});

  TradingCardData.fromJson(Map<String, dynamic> json) {
    maxBid = json['max_bid'];
    numberOfBuyers = json['number_of_buyers'];
    utBought = json['ut_bought'];
    maxPrice = json['max_price'];
    minPrice = json['min_price'];
    utMatched = json['ut_matched'];
    minAsk = json['min_ask'];
    numberOfSellers = json['number_of_sellers'];
    utSold = json['ut_sold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['max_bid'] = maxBid;
    data['number_of_buyers'] = numberOfBuyers;
    data['ut_bought'] = utBought;
    data['max_price'] = maxPrice;
    data['min_price'] = minPrice;
    data['ut_matched'] = utMatched;
    data['min_ask'] = minAsk;
    data['number_of_sellers'] = numberOfSellers;
    data['ut_sold'] = utSold;
    return data;
  }
}
