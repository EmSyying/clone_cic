class Currency {
  int? id;
  String? name;
  String? sign;

  Currency({this.id, this.name, this.sign});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sign = json['sign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sign'] = sign;
    return data;
  }
}
