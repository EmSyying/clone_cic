class StoreBranchModel {
  StoreBranchModel({
    this.id = 0,
    this.shop_logo = "",
    this.shopName = "",
    this.amount = "",
  });
  late final int id;
  late final String shop_logo;
  late final String shopName;
  late final String amount;

  StoreBranchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shop_logo = json['shop_logo'];
    shopName = json['shop_name'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['shop_logo'] = shop_logo;
    data['shop_name'] = shopName;
    data['amount'] = amount;
    return data;
  }
}

class StoreBranchMetaModel {
  StoreBranchMetaModel({
    this.currentPage = 0,
    this.from = 0,
    this.lastPage = 0,
    this.perPage = 0,
    this.to = 0,
    this.total = 0,
  });
  late final int currentPage;
  late final int from;
  late final int lastPage;
  late final int perPage;
  late final int to;
  late final int total;

  StoreBranchMetaModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'] ?? 0;
    from = json['from'] ?? 0;
    lastPage = json['last_page'] ?? 0;
    perPage = json['per_page'] ?? 0;
    to = json['to'] ?? 0;
    total = json['total'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}
