class AboutCICModel {
  int? id;
  String? conpamyName;
  String? conpamyLink;
  String? companyLogo;

  AboutCICModel(
      {this.id, this.conpamyName, this.conpamyLink, this.companyLogo});

  AboutCICModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    conpamyName = json['conpamy_name'];
    conpamyLink = json['conpamy_link'];
    companyLogo = json['company_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['conpamy_name'] = conpamyName;
    data['conpamy_link'] = conpamyLink;
    data['company_logo'] = companyLogo;
    return data;
  }
}

class AboutCiCFeature {
  String? aboutCiCKhmer;
  String? aboutCiCEnglish;

  AboutCiCFeature({this.aboutCiCKhmer, this.aboutCiCEnglish});

  AboutCiCFeature.fromJson(Map<String, dynamic> json) {
    aboutCiCKhmer = json['about_app_khmer'];
    aboutCiCEnglish = json['about_app_english'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['about_app_khmer'] = aboutCiCKhmer;
    data['about_app_english'] = aboutCiCEnglish;
    return data;
  }
}
