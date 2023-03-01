class StoreBranchModel {
  StoreBranchModel({
    this.id = 0,
    this.mvpLogo = "",
    this.shopName = "",
    this.amount = "",
  });
  late final int id;
  late final String mvpLogo;
  late final String shopName;
  late final String amount;

  StoreBranchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mvpLogo = json['mvp_logo'];
    shopName = json['shop_name'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['mvp_logo'] = mvpLogo;
    data['shop_name'] = shopName;
    data['amount'] = amount;
    return data;
  }
}
