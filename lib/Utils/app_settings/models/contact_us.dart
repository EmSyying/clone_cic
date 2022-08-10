class ContactUs {
  String? companyKhmerName;
  String? companyEnglishName;
  String? companyHeadOffice;
  String? companyPhone;
  String? companyEmail;
  String? logo;
  String? companyPhoneList;
  String? telegramLink;

  ContactUs(
      {this.companyKhmerName,
      this.companyEnglishName,
      this.companyHeadOffice,
      this.companyPhone,
      this.companyEmail,
      this.logo,
      this.companyPhoneList,
      this.telegramLink});

  ContactUs.fromJson(Map<String, dynamic> json) {
    companyKhmerName = json['company_khmer_name'];
    companyEnglishName = json['company_english_name'];
    companyHeadOffice = json['company_head_office'];
    companyPhone = json['company_phone'];
    companyEmail = json['company_email'];
    logo = json['logo'];
    companyPhoneList = json['company_phone_list'];
    telegramLink = json['telegram_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_khmer_name'] = companyKhmerName;
    data['company_english_name'] = companyEnglishName;
    data['company_head_office'] = companyHeadOffice;
    data['company_phone'] = companyPhone;
    data['company_email'] = companyEmail;
    data['logo'] = logo;
    data['company_phone_list'] = companyPhoneList;
    data['telegram_link'] = telegramLink;
    return data;
  }
}
