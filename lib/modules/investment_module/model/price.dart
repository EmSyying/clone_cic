class Price {
  int? id;
  String? price;
  String? date;
  bool? isLatest;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  num? priceUnformat;

  Price(
      {this.id,
      this.priceUnformat,
      this.price,
      this.date,
      this.isLatest,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt});

  Price.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    price = json['price'];
    date = json['date'];
    isLatest = json['is_latest'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    priceUnformat = json['price_unformat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['date'] = date;
    data['is_latest'] = isLatest;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    data['updated_by'] = updatedBy;
    data['updated_at'] = updatedAt;
    data['price_unformat'] = priceUnformat;
    return data;
  }
}
