import 'package:cicgreenloan/modules/get_funding/models/financing_purpose_model.dart';
import 'package:cicgreenloan/modules/member_directory/models/member_personal_profile.dart';

class CustomerInfo {
  String? customerName;
  FinancialPurpose? customerGender;
  String? customerDateOfBirth;
  String? customerEmail;
  String? currentHouseNo;
  String? currentStreetNo;
  CurrentAddress? currentAddress;
  String? residenceHouseNo;
  String? residenceStreetNo;
  CurrentAddress? residenceAddress;

  CustomerInfo(
      {this.customerName,
      this.customerGender,
      this.customerDateOfBirth,
      this.customerEmail,
      this.currentHouseNo,
      this.currentStreetNo,
      this.currentAddress,
      this.residenceHouseNo,
      this.residenceStreetNo,
      this.residenceAddress});

  CustomerInfo.fromJson(Map<String, dynamic> json) {
    customerName = json['customer_name'];
    customerGender = json['customer_gender'] != null
        ? FinancialPurpose.fromJson(json['customer_gender'])
        : null;
    customerDateOfBirth = json['customer_date_of_birth'];
    customerEmail = json['customer_email'];
    currentHouseNo = json['current_house_no'];
    currentStreetNo = json['current_street_no'];
    currentAddress = json['current_address'] != null
        ? CurrentAddress.fromJson(json['current_address'])
        : null;
    residenceHouseNo = json['residence_house_no'];
    residenceStreetNo = json['residence_street_no'];
    residenceAddress = json['residence_address'] != null
        ? CurrentAddress.fromJson(json['residence_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_name'] = customerName;
    if (customerGender != null) {
      data['customer_gender'] = customerGender!.toJson();
    }
    data['customer_date_of_birth'] = customerDateOfBirth;
    data['customer_email'] = customerEmail;
    data['current_house_no'] = currentHouseNo;
    data['current_street_no'] = currentStreetNo;
    if (currentAddress != null) {
      data['current_address'] = currentAddress!.toJson();
    }
    data['residence_house_no'] = residenceHouseNo;
    data['residence_street_no'] = residenceStreetNo;
    if (residenceAddress != null) {
      data['residence_address'] = residenceAddress!.toJson();
    }
    return data;
  }
}
