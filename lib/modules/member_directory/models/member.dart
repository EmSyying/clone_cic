class Member {
  int? id;
  String? name;
  String? lastName;
  String? position;
  String? company;
  String? dateOfBirth;
  String? gender;
  String? defaultPhoto;
  String? photo;
  String? email;
  String? phone;
  String? secondName;
  bool? isAgree;
  String? recommended;
  num? percentage;
  num? numberShare;
  String? memberType;
  String? investorType;
  String? qiid;
  String? about;
  String? address;
  // Companies companies;
  bool? isTicked = false;
  List<HiddenFields>? hiddenFields;

  Member(
      {this.id,
      this.name,
      this.lastName,
      this.position,
      this.company,
      this.dateOfBirth,
      this.gender,
      this.defaultPhoto,
      this.photo,
      this.email,
      this.phone,
      this.secondName,
      this.isAgree,
      this.recommended,
      this.percentage,
      this.numberShare,
      this.memberType,
      this.investorType,
      this.qiid,
      this.about,
      this.address,
      // this.companies,
      this.hiddenFields,
      this.isTicked});

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['last_name'];
    position = json['position'];
    company = json['company'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    defaultPhoto = json['default_photo'];
    photo = json['photo'];
    email = json['email'];
    phone = json['phone'];
    secondName = json['second_name'];
    isAgree = json['is_agree'];
    recommended = json['recommended'];
    percentage = json['percentage'];
    numberShare = json['number_share'];
    memberType = json['member_type'];
    investorType = json['investor_type'];
    qiid = json['qiid'];
    about = json['about'];
    address = json['address'];
    // companies = json['companies'] != null
    //     ? new Companies.fromJson(json['companies'])
    //     : null;
    if (json['hidden_fields'] != null) {
      hiddenFields = <HiddenFields>[];
      json['hidden_fields'].forEach((v) {
        hiddenFields!.add(HiddenFields.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['last_name'] = lastName;
    data['position'] = position;
    data['company'] = company;
    data['date_of_birth'] = dateOfBirth;
    data['gender'] = gender;
    data['default_photo'] = defaultPhoto;
    data['photo'] = photo;
    data['email'] = email;
    data['phone'] = phone;
    data['second_name'] = secondName;
    data['is_agree'] = isAgree;
    data['recommended'] = recommended;
    data['percentage'] = percentage;
    data['number_share'] = numberShare;
    data['member_type'] = memberType;
    data['investor_type'] = investorType;
    data['qiid'] = qiid;
    data['about'] = about;
    data['address'] = address;
    // if (this.companies != null) {
    //   data['companies'] = this.companies.toJson();
    // }
    if (hiddenFields != null) {
      data['hidden_fields'] = hiddenFields!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Companies {
  String? name;
  String? logo;
  String? website;
  int? founded;
  String? size;
  String? address;

  Companies(
      {this.name,
      this.logo,
      this.website,
      this.founded,
      this.size,
      this.address});

  Companies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    logo = json['logo'];
    website = json['website'];
    founded = json['founded'];
    size = json['size'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['logo'] = logo;
    data['website'] = website;
    data['founded'] = founded;
    data['size'] = size;
    data['address'] = address;
    return data;
  }
}

class HiddenFields {
  String? field;

  HiddenFields({this.field});

  HiddenFields.fromJson(Map<String, dynamic> json) {
    field = json['field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['field'] = field;
    return data;
  }
}
