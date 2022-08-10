class SharePriceData {
  num? totalShareOutstanding;
  num? totalNetWorth;
  List<Evolution>? evolution;

  SharePriceData(
      {this.totalShareOutstanding, this.totalNetWorth, this.evolution});

  SharePriceData.fromJson(Map<String, dynamic> json) {
    totalShareOutstanding = json['total_share_outstanding'];
    totalNetWorth = json['total_net_worth'];
    if (json['evolution'] != null) {
      evolution = <Evolution>[];
      json['evolution'].forEach((v) {
        evolution!.add(Evolution.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_share_outstanding'] = totalShareOutstanding;
    data['total_net_worth'] = totalNetWorth;
    if (evolution != null) {
      data['evolution'] = evolution!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Evolution {
  String? date;
  num? price;
  int? isLatest;

  Evolution({this.date, this.price, this.isLatest});

  Evolution.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    price = json['price'];
    isLatest = json['is_latest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['price'] = price;
    data['is_latest'] = isLatest;
    return data;
  }
}
