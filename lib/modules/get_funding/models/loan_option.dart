class Option {
  int? id;
  String? productType;
  String? productName;

  Option({this.id, this.productName, this.productType});

  Option.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productType = json['product_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_name'] = productName;
    data['product_type'] = productType;
    return data;
  }
}
