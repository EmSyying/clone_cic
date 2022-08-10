import 'package:cicgreenloan/utils/select_address/address_model/address.dart';
import 'package:equatable/equatable.dart';

class PersonalProfileModel {
  int? id;
  String? display;
  String? customerName;
  String? customerLatinName;
  String? customerDateOfBirth;
  CustomerGender? customerGender;
  CustomerGender? customerNationality;
  CustomerGender? position;
  String? recommended;
  int? numberShare;
  String? expertise;
  String? memberType;
  String? yearJoined;
  String? profileBiography;
  String? about;
  String? other;
  CustomerGender? customerIdentityType;
  String? customerIdentityNumber;
  String? customerIdentityDate;
  String? customerIdentityExpiredDate;
  CurrentAddress? currentAddress;
  String? streetNo;
  String? houseNo;
  CurrentAddress? permanentAddress;
  String? permanentStreetNo;
  String? permanentHouseNo;
  String? phone;
  String? email;
  String? whatapp;
  String? telegram;
  String? messenger;
  String? skype;
  String? website;
  String? facebook;
  String? linkedin;
  String? twitter;

  PersonalProfileModel(
      {this.id,
      this.display,
      this.customerName,
      this.customerLatinName,
      this.customerDateOfBirth,
      this.customerGender,
      this.customerNationality,
      this.position,
      this.recommended,
      this.numberShare,
      this.expertise,
      this.memberType,
      this.yearJoined,
      this.profileBiography,
      this.about,
      this.other,
      this.customerIdentityType,
      this.customerIdentityNumber,
      this.customerIdentityDate,
      this.customerIdentityExpiredDate,
      this.currentAddress,
      this.streetNo,
      this.houseNo,
      this.permanentAddress,
      this.permanentStreetNo,
      this.permanentHouseNo,
      this.phone,
      this.email,
      this.whatapp,
      this.telegram,
      this.messenger,
      this.skype,
      this.website,
      this.facebook,
      this.linkedin,
      this.twitter});

  PersonalProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    display = json['display'];
    customerName = json['customer_name'];
    customerLatinName = json['customer_latin_name'];
    customerDateOfBirth = json['customer_date_of_birth'];
    customerGender = json['customer_gender'] != null
        ? CustomerGender.fromJson(json['customer_gender'])
        : null;
    customerNationality = json['customer_nationality'] != null
        ? CustomerGender.fromJson(json['customer_nationality'])
        : null;
    position = json['position'] != null
        ? CustomerGender.fromJson(json['position'])
        : null;
    recommended = json['recommended'];
    numberShare = json['number_share'];
    expertise = json['expertise'];
    memberType = json['member_type'];
    yearJoined = json['year_joined'];
    profileBiography = json['profile_biography'];
    about = json['about'];
    other = json['other'];
    customerIdentityType = json['customer_identity_type'] != null
        ? CustomerGender.fromJson(json['customer_identity_type'])
        : null;
    customerIdentityNumber = json['customer_identity_number'];
    customerIdentityDate = json['customer_identity_date'];
    customerIdentityExpiredDate = json['customer_identity_expired_date'];
    currentAddress = json['current_address'] != null
        ? CurrentAddress.fromJson(json['current_address'])
        : null;
    streetNo = json['street_no'];
    houseNo = json['house_no'];
    permanentAddress = json['permanent_address'] != null
        ? CurrentAddress.fromJson(json['permanent_address'])
        : null;
    permanentStreetNo = json['permanent_street_no'];
    permanentHouseNo = json['permanent_house_no'];
    phone = json['phone'];
    email = json['email'];
    whatapp = json['whatapp'];
    telegram = json['telegram'];
    messenger = json['messenger'];
    skype = json['skype'];
    website = json['website'];
    facebook = json['facebook'];
    linkedin = json['linkedin'];
    twitter = json['twitter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['display'] = display;
    data['customer_name'] = customerName;
    data['customer_latin_name'] = customerLatinName;
    data['customer_date_of_birth'] = customerDateOfBirth;
    if (customerGender != null) {
      data['customer_gender'] = customerGender!.toJson();
    }
    if (customerNationality != null) {
      data['customer_nationality'] = customerNationality!.toJson();
    }
    if (position != null) {
      data['position'] = position!.toJson();
    }
    data['recommended'] = recommended;
    data['number_share'] = numberShare;
    data['expertise'] = expertise;
    data['member_type'] = memberType;
    data['year_joined'] = yearJoined;
    data['profile_biography'] = profileBiography;
    data['about'] = about;
    data['other'] = other;
    if (customerIdentityType != null) {
      data['customer_identity_type'] = customerIdentityType!.toJson();
    }
    data['customer_identity_number'] = customerIdentityNumber;
    data['customer_identity_date'] = customerIdentityDate;
    data['customer_identity_expired_date'] = customerIdentityExpiredDate;
    if (currentAddress != null) {
      data['current_address'] = currentAddress!.toJson();
    }
    data['street_no'] = streetNo;
    data['house_no'] = houseNo;
    if (permanentAddress != null) {
      data['permanent_address'] = permanentAddress!.toJson();
    }
    data['permanent_street_no'] = permanentStreetNo;
    data['permanent_house_no'] = permanentHouseNo;
    data['phone'] = phone;
    data['email'] = email;
    data['whatapp'] = whatapp;
    data['telegram'] = telegram;
    data['messenger'] = messenger;
    data['skype'] = skype;
    data['website'] = website;
    data['facebook'] = facebook;
    data['linkedin'] = linkedin;
    data['twitter'] = twitter;
    return data;
  }
}

class CustomerGender {
  int? id;
  String? display;
  String? displayKhmer;

  CustomerGender({this.id, this.display, this.displayKhmer});

  CustomerGender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    display = json['display'];
    displayKhmer = json['display_khmer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['display'] = display;
    data['display_khmer'] = displayKhmer;
    return data;
  }
}

// ignore: must_be_immutable
class CurrentAddress extends Equatable {
  Address? city;
  Address? district;
  Address? commune;
  Address? village;

  CurrentAddress({this.city, this.district, this.commune, this.village});

  CurrentAddress.fromJson(Map<String, dynamic> json) {
    city = json['city'] != null ? Address.fromJson(json['city']) : null;
    district =
        json['district'] != null ? Address.fromJson(json['district']) : null;
    commune =
        json['commune'] != null ? Address.fromJson(json['commune']) : null;
    village =
        json['village'] != null ? Address.fromJson(json['village']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (district != null) {
      data['district'] = district!.toJson();
    }
    if (commune != null) {
      data['commune'] = commune!.toJson();
    }
    if (village != null) {
      data['village'] = village!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [city, district, commune, village];
}

class City {
  String? code;
  String? name;

  City({this.code, this.name});

  City.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}
