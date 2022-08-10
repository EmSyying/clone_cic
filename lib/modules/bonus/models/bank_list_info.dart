class BankData {
  int? id;
  String? name;
  int? digits;

  BankData({this.id, this.name, this.digits});

  BankData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    digits = json['digits'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['digits'] = digits;
    return data;
  }
}
