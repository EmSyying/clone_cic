class CiCEquityFun {
  num? totalUt;
  num? totalPrice;

  CiCEquityFun({this.totalUt, this.totalPrice});

  CiCEquityFun.fromJson(Map<String, dynamic> json) {
    totalUt = json['total_ut'];
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_ut'] = totalUt;
    data['total_price'] = totalPrice;
    return data;
  }
}
