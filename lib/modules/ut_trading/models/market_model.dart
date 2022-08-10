class MarketModel {
  int? id;
  int? basePrice;
  int? minBasePrice;
  int? maxBasePrice;
  String? startDate;
  String? endDate;

  MarketModel(
      {this.id,
      this.basePrice,
      this.minBasePrice,
      this.maxBasePrice,
      this.startDate,
      this.endDate});

  MarketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    basePrice = json['base_price'];
    minBasePrice = json['min_base_price'];
    maxBasePrice = json['max_base_price'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['base_price'] = basePrice;
    data['min_base_price'] = minBasePrice;
    data['max_base_price'] = maxBasePrice;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    return data;
  }
}
