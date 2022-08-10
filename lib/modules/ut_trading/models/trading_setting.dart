class TradingSettingModel {
  bool? success;
  Data? data;

  TradingSettingModel({this.success, this.data});

  TradingSettingModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Market? market;
  num? availableUt;
  int? maxNumberOfShareForSelling;
  int? maxNumberOfShareForBuying;
  int? minNumberOfShareForSelling;
  int? minNumberOfShareForBuying;
  bool? allowSellRequest;
  bool? allowBuyRequest;
  num? atLessFeeamount;
  num? feeInPercentage;
  Data(
      {this.market,
      this.availableUt,
      this.maxNumberOfShareForSelling,
      this.maxNumberOfShareForBuying,
      this.minNumberOfShareForSelling,
      this.minNumberOfShareForBuying,
      this.allowBuyRequest,
      this.allowSellRequest,
      this.atLessFeeamount,
      this.feeInPercentage});

  Data.fromJson(Map<String, dynamic> json) {
    market = json['market'] != null ? Market.fromJson(json['market']) : null;
    availableUt = json['available_ut'];
    maxNumberOfShareForSelling = json['max_number_of_share_for_selling'];
    maxNumberOfShareForBuying = json['max_number_of_share_for_buying'];
    minNumberOfShareForSelling = json['min_number_of_share_for_selling'];
    minNumberOfShareForBuying = json['min_number_of_share_for_buying'];
    allowSellRequest = json['allow_sell_request'];
    allowBuyRequest = json['allow_buy_request'];
    atLessFeeamount = json['at_less_fee_amount'];
    feeInPercentage = json['fee_in_percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (market != null) {
      data['market'] = market!.toJson();
    }
    data['available_ut'] = availableUt;
    data['max_number_of_share_for_selling'] = maxNumberOfShareForSelling;
    data['max_number_of_share_for_buying'] = maxNumberOfShareForBuying;
    data['min_number_of_share_for_selling'] = minNumberOfShareForSelling;
    data['min_number_of_share_for_buying'] = minNumberOfShareForBuying;
    data['allow_sell_request'] = allowSellRequest;
    data['allow_buy_request'] = allowBuyRequest;

    return data;
  }
}

class Market {
  int? id;
  num? basePrice;
  num? minBasePrice;
  num? maxBasePrice;
  String? startDate;
  String? endDate;
  bool? open;
  String? fromTime;
  String? toTime;
  Market(
      {this.id,
      this.basePrice,
      this.minBasePrice,
      this.maxBasePrice,
      this.startDate,
      this.endDate,
      this.open = false,
      this.fromTime,
      this.toTime});

  Market.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    basePrice = json['base_price'];
    minBasePrice = json['min_base_price'];
    maxBasePrice = json['max_base_price'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    open = json['open'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['base_price'] = basePrice;
    data['min_base_price'] = minBasePrice;
    data['max_base_price'] = maxBasePrice;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['open'] = open;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    return data;
  }
}
