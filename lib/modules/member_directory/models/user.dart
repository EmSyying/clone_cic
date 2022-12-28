import 'package:cicgreenloan/modules/member_directory/models/screen_lock.dart';

class User {
  int? id;
  int? isCustomer;
  int? customerId;
  String? code;
  String? firstName;
  String? lastName;
  String? fullName;
  String? secondName;
  String? dateOfBirth;
  String? phone;
  String? email;
  ScreenLock? screenLock;
  bool? isAgree;
  String? recommended;
  num? percentage;
  num? numberShare;
  String? blockShare;
  List<String>? memberType;
  bool? enableNotification;
  String? investorType;
  String? qiid;
  String? about;
  String? address;
  Companies? companies;
  Gender? gender;
  Gender? employmentStatus;
  String? income;
  Gender? position;
  String? company;
  String? houseNo;
  String? streetNo;
  CurrentAddress? currentAddress;
  String? permanentHouseNo;
  String? permanentStreetNo;
  CurrentAddress? permanentAddress;
  String? idCard;
  String? familyBook;
  String? residenceBook;
  String? profile;
  String? selfiesPhoto;
  String? letterOfBirthPhoto;
  int? numberOfChildren;
  int? numberOfFamilyMember;
  String? cbcCheck;
  int? cbcScores;
  Gender? shiftWorks;
  String? businessesIncome;
  Gender? typeOfBusinessActivities;
  String? generalExpenses;
  int? yesOrNoLoanLeasingRepaymentExpenses;
  String? loanLeasingRepaymentExpenses;
  String? certificateOrContractOfEmployment;
  String? salarySlip;
  String? backIdCard;
  String? nameOfInstitution;
  int? confirmationAllInformation;
  Purpose? purpose;
  String? pinCode;
  String? companyName;
  String? title;
  String? location;

  User({
    this.id,
    this.isCustomer,
    this.customerId,
    this.code,
    this.firstName,
    this.lastName,
    this.fullName,
    this.secondName,
    this.dateOfBirth,
    this.phone,
    this.email,
    this.screenLock,
    this.isAgree,
    this.recommended,
    this.percentage,
    this.numberShare,
    this.blockShare,
    this.memberType,
    this.investorType,
    this.qiid,
    this.about,
    this.address,
    this.companies,
    this.gender,
    this.employmentStatus,
    this.income,
    this.position,
    this.company,
    this.houseNo,
    this.streetNo,
    this.currentAddress,
    this.permanentHouseNo,
    this.permanentStreetNo,
    this.permanentAddress,
    this.idCard,
    this.familyBook,
    this.residenceBook,
    this.profile,
    this.selfiesPhoto,
    this.enableNotification,
    this.letterOfBirthPhoto,
    this.numberOfChildren,
    this.numberOfFamilyMember,
    this.cbcCheck,
    this.cbcScores,
    this.shiftWorks,
    this.businessesIncome,
    this.typeOfBusinessActivities,
    this.generalExpenses,
    this.yesOrNoLoanLeasingRepaymentExpenses,
    this.loanLeasingRepaymentExpenses,
    this.certificateOrContractOfEmployment,
    this.salarySlip,
    this.backIdCard,
    this.nameOfInstitution,
    this.confirmationAllInformation,
    this.purpose,
    this.pinCode,
    this.companyName,
    this.title,
    this.location,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isCustomer = json['is_customer'];
    customerId = json['customer_id'];
    code = json['code'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    secondName = json['second_name'];
    dateOfBirth = json['date_of_birth'];
    phone = json['phone'];
    email = json['email'];
    screenLock = json['screen_lock'] != null
        ? ScreenLock.fromJson(json['screen_lock'])
        : null;
    isAgree = json['is_agree'];
    enableNotification = json['enable_notification'];
    recommended = json['recommended'];
    percentage = json['percentage'];
    numberShare = json['number_share'];
    blockShare = json['block_share'];
    memberType = json['member_type'].cast<String>();
    investorType = json['investor_type'];
    qiid = json['qiid'];
    about = json['about'];
    address = json['address'];
    companies = json['companies'] != null
        ? Companies.fromJson(json['companies'])
        : null;
    gender = json['gender'] != null ? Gender.fromJson(json['gender']) : null;
    employmentStatus = json['employment_status'] != null
        ? Gender.fromJson(json['employment_status'])
        : null;
    income = json['income'];
    position =
        json['position'] != null ? Gender.fromJson(json['position']) : null;
    company = json['company'];
    houseNo = json['house_no'];
    streetNo = json['street_no'];
    currentAddress = json['current_address'] != null
        ? CurrentAddress.fromJson(json['current_address'])
        : null;
    permanentHouseNo = json['permanent_house_no'];
    permanentStreetNo = json['permanent_street_no'];
    permanentAddress = json['permanent_address'] != null
        ? CurrentAddress.fromJson(json['permanent_address'])
        : null;
    idCard = json['id_card'];
    familyBook = json['family_book'];
    residenceBook = json['residence_book'];
    profile = json['profile'];
    selfiesPhoto = json['selfies_photo'];
    letterOfBirthPhoto = json['letter_of_birth_photo'];
    numberOfChildren = json['number_of_children'];
    numberOfFamilyMember = json['number_of_family_member'];
    cbcCheck = json['cbc_check'];
    cbcScores = json['cbc_scores'];
    shiftWorks = json['shift_works'] != null
        ? Gender.fromJson(json['shift_works'])
        : null;
    businessesIncome = json['businesses_income'];
    typeOfBusinessActivities = json['type_of_business_activities'] != null
        ? Gender.fromJson(json['type_of_business_activities'])
        : null;
    generalExpenses = json['general_expenses'];
    yesOrNoLoanLeasingRepaymentExpenses =
        json['yes_or_no_loan_leasing_repayment_expenses'];
    loanLeasingRepaymentExpenses = json['loan_leasing_repayment_expenses'];
    certificateOrContractOfEmployment =
        json['certificate_or_contract_of_employment'];
    salarySlip = json['salary_slip'];
    backIdCard = json['back_id_card'];
    nameOfInstitution = json['name_of_institution'];
    confirmationAllInformation = json['confirmation_all_information'];
    purpose =
        json['purpose'] != null ? Purpose.fromJson(json['purpose']) : null;
    pinCode = json['pin_code'];
    companyName = json['company_name'];
    title = json['title'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['is_customer'] = isCustomer;
    data['customer_id'] = customerId;
    data['code'] = code;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['full_name'] = fullName;
    data['second_name'] = secondName;
    data['date_of_birth'] = dateOfBirth;
    data['phone'] = phone;
    data['email'] = email;
    data['is_agree'] = isAgree;
    data['recommended'] = recommended;
    data['percentage'] = percentage;
    data['number_share'] = numberShare;
    data['block_share'] = blockShare;
    data['member_type'] = memberType;
    data['investor_type'] = investorType;
    data['qiid'] = qiid;
    data['about'] = about;
    data['address'] = address;
    data['company_name'] = companyName;
    data['title'] = title;
    data['location'] = location;
    if (companies != null) {
      data['companies'] = companies!.toJson();
    }
    if (gender != null) {
      data['gender'] = gender!.toJson();
    }
    if (employmentStatus != null) {
      data['employment_status'] = employmentStatus!.toJson();
    }
    data['income'] = income;
    if (position != null) {
      data['position'] = position!.toJson();
    }
    data['company'] = company;
    data['house_no'] = houseNo;
    data['street_no'] = streetNo;
    if (currentAddress != null) {
      data['current_address'] = currentAddress!.toJson();
    }
    data['permanent_house_no'] = permanentHouseNo;
    data['permanent_street_no'] = permanentStreetNo;
    if (permanentAddress != null) {
      data['permanent_address'] = permanentAddress!.toJson();
    }
    data['id_card'] = idCard;
    data['family_book'] = familyBook;
    data['residence_book'] = residenceBook;
    data['profile'] = profile;
    data['selfies_photo'] = selfiesPhoto;
    data['letter_of_birth_photo'] = letterOfBirthPhoto;
    data['number_of_children'] = numberOfChildren;
    data['number_of_family_member'] = numberOfFamilyMember;
    data['cbc_check'] = cbcCheck;
    data['cbc_scores'] = cbcScores;
    if (shiftWorks != null) {
      data['shift_works'] = shiftWorks!.toJson();
    }
    data['businesses_income'] = businessesIncome;
    if (typeOfBusinessActivities != null) {
      data['type_of_business_activities'] = typeOfBusinessActivities!.toJson();
    }
    data['general_expenses'] = generalExpenses;
    data['yes_or_no_loan_leasing_repayment_expenses'] =
        yesOrNoLoanLeasingRepaymentExpenses;
    data['loan_leasing_repayment_expenses'] = loanLeasingRepaymentExpenses;
    data['certificate_or_contract_of_employment'] =
        certificateOrContractOfEmployment;
    data['salary_slip'] = salarySlip;
    data['back_id_card'] = backIdCard;
    data['name_of_institution'] = nameOfInstitution;
    data['confirmation_all_information'] = confirmationAllInformation;
    data['pin_code'] = pinCode;
    if (purpose != null) {
      data['purpose'] = purpose!.toJson();
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

class Gender {
  int? id;
  String? display;
  bool? isSelected = false;

  Gender({this.id, this.display, this.isSelected});

  Gender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    display = json['display'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['display'] = display;
    return data;
  }
}

class CurrentAddress {
  City? city;
  City? district;
  City? commune;
  City? village;

  CurrentAddress({this.city, this.district, this.commune, this.village});

  CurrentAddress.fromJson(Map<String, dynamic> json) {
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    district =
        json['district'] != null ? City.fromJson(json['district']) : null;
    commune = json['commune'] != null ? City.fromJson(json['commune']) : null;
    village = json['village'] != null ? City.fromJson(json['village']) : null;
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

class Purpose {
  int? id;
  String? display;

  Purpose({this.id, this.display});

  Purpose.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    display = json['display'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['display'] = display;
    return data;
  }
}
