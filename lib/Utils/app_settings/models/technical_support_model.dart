class TechnicalSupportModel {
  String? phone;
  String? link;

  TechnicalSupportModel({this.phone, this.link});

  TechnicalSupportModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['link'] = link;
    return data;
  }
}
