import 'package:cicgreenloan/modules/get_funding/models/application_detail.dart';
import 'package:cicgreenloan/modules/get_funding/models/cash_flow_model.dart';
import 'package:cicgreenloan/modules/get_funding/models/file_model.dart';
import 'package:cicgreenloan/modules/get_funding/models/financing_purpose_model.dart';
import 'package:cicgreenloan/modules/ut_trading/models/link.dart';

class GetFundingModels {
  List<Data>? data;
  Links? links;
  Meta? meta;

  GetFundingModels({this.data, this.links, this.meta});

  GetFundingModels.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? status;
  int? term;
  int? financialAmount;
  FinancialPurpose? financialPurpose;
  String? intendedDateDisbursement;
  String? reason;
  String? updatedAt;
  String? createdAt;
  FilesModel? debtFile;
  CustomerInfo? customerInfo;
  Company? company;

  Data(
      {this.id,
      this.status,
      this.term,
      this.financialAmount,
      this.financialPurpose,
      this.intendedDateDisbursement,
      this.reason,
      this.updatedAt,
      this.createdAt,
      this.debtFile,
      this.customerInfo,
      this.company});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    term = json['term'];
    financialAmount = json['financial_amount'];
    financialPurpose = json['financial_purpose'] != null
        ? FinancialPurpose.fromJson(json['financial_purpose'])
        : null;
    intendedDateDisbursement = json['intended_date_disbursement'];
    reason = json['reason'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    debtFile = json['debt_file'] != null
        ? FilesModel.fromJson(json['debt_file'])
        : null;
    customerInfo = json['customer_info'] != null
        ? CustomerInfo.fromJson(json['customer_info'])
        : null;
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['term'] = term;
    data['financial_amount'] = financialAmount;
    if (financialPurpose != null) {
      data['financial_purpose'] = financialPurpose!.toJson();
    }
    data['intended_date_disbursement'] = intendedDateDisbursement;
    data['reason'] = reason;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    if (debtFile != null) {
      data['debt_file'] = debtFile!.toJson();
    }
    if (customerInfo != null) {
      data['customer_info'] = customerInfo!.toJson();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }
}

class Company {
  int? id;
  int? memberId;
  String? companyName;
  String? khmerName;
  FinancialPurpose? majorOfBusiness;
  String? position;
  FinancialPurpose? legalStatus;
  FinancialPurpose? registeredBusiness;
  int? companySize;
  int? numberOfBranches;
  FinancialPurpose? businessModel;
  String? capitalInvestment;
  String? yearFounded;
  int? isPrimary;
  String? companyDiagnosticReport;
  String? companyMilestones;
  String? companyLogo;
  String? serviceImages;
  String? personalInterest;
  String? companyProfile;
  String? companyProductAndService;
  String? houseNo;
  String? streetNo;
  String? address;
  String? phoneNumber;
  String? email;
  String? whatApp;
  String? telegram;
  String? messenger;
  String? skype;
  String? weChat;
  String? website;
  String? facebook;
  String? linkedin;
  String? twitter;
  FinancialPurpose? typeOfOrganization;
  FinancialPurpose? industry;
  String? taxIdentificationNumber;
  int? numberOfStaff;
  String? ownerName;
  FileForm? companyFiles;

  Company(
      {this.id,
      this.memberId,
      this.companyName,
      this.khmerName,
      this.majorOfBusiness,
      this.position,
      this.legalStatus,
      this.registeredBusiness,
      this.companySize,
      this.numberOfBranches,
      this.businessModel,
      this.capitalInvestment,
      this.yearFounded,
      this.isPrimary,
      this.companyDiagnosticReport,
      this.companyMilestones,
      this.companyLogo,
      this.serviceImages,
      this.personalInterest,
      this.companyProfile,
      this.companyProductAndService,
      this.houseNo,
      this.streetNo,
      this.address,
      this.phoneNumber,
      this.email,
      this.whatApp,
      this.telegram,
      this.messenger,
      this.skype,
      this.weChat,
      this.website,
      this.facebook,
      this.linkedin,
      this.twitter,
      this.typeOfOrganization,
      this.industry,
      this.taxIdentificationNumber,
      this.numberOfStaff,
      this.ownerName,
      this.companyFiles});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    companyName = json['company_name'];
    khmerName = json['khmer_name'];
    majorOfBusiness = json['major_of_business'] != null
        ? FinancialPurpose.fromJson(json['major_of_business'])
        : null;
    position = json['position'];
    legalStatus = json['legal_status'] != null
        ? FinancialPurpose.fromJson(json['legal_status'])
        : null;
    registeredBusiness = json['registered_business'] != null
        ? FinancialPurpose.fromJson(json['registered_business'])
        : null;
    companySize = json['company_size'];
    numberOfBranches = json['number_of_branches'];
    businessModel = json['business_model'] != null
        ? FinancialPurpose.fromJson(json['business_model'])
        : null;
    capitalInvestment = json['capital_investment'];
    yearFounded = json['year_founded'];
    isPrimary = json['is_primary'];
    companyDiagnosticReport = json['company_diagnostic_report'];
    companyMilestones = json['company_milestones'];
    companyLogo = json['company_logo'];
    serviceImages = json['service_images'];
    personalInterest = json['personal_interest'];
    companyProfile = json['company_profile'];
    companyProductAndService = json['company_product_and_service'];
    houseNo = json['house_no'];
    streetNo = json['street_no'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    whatApp = json['what_app'];
    telegram = json['telegram'];
    messenger = json['messenger'];
    skype = json['skype'];
    weChat = json['we_chat'];
    website = json['website'];
    facebook = json['facebook'];
    linkedin = json['linkedin'];
    twitter = json['twitter'];
    typeOfOrganization = json['type_of_organization'] != null
        ? FinancialPurpose.fromJson(json['type_of_organization'])
        : null;
    industry = json['industry'] != null
        ? FinancialPurpose.fromJson(json['industry'])
        : null;
    taxIdentificationNumber = json['tax_identification_number'];
    numberOfStaff = json['number_of_staff'];
    ownerName = json['owner_name'];
    companyFiles = json['company_files'] != null
        ? FileForm.fromJson(json['company_files'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['member_id'] = memberId;
    data['company_name'] = companyName;
    data['khmer_name'] = khmerName;
    if (majorOfBusiness != null) {
      data['major_of_business'] = majorOfBusiness!.toJson();
    }
    data['position'] = position;
    if (legalStatus != null) {
      data['legal_status'] = legalStatus!.toJson();
    }
    if (registeredBusiness != null) {
      data['registered_business'] = registeredBusiness!.toJson();
    }
    data['company_size'] = companySize;
    data['number_of_branches'] = numberOfBranches;
    if (businessModel != null) {
      data['business_model'] = businessModel!.toJson();
    }
    data['capital_investment'] = capitalInvestment;
    data['year_founded'] = yearFounded;
    data['is_primary'] = isPrimary;
    data['company_diagnostic_report'] = companyDiagnosticReport;
    data['company_milestones'] = companyMilestones;
    data['company_logo'] = companyLogo;
    data['service_images'] = serviceImages;
    data['personal_interest'] = personalInterest;
    data['company_profile'] = companyProfile;
    data['company_product_and_service'] = companyProductAndService;
    data['house_no'] = houseNo;
    data['street_no'] = streetNo;
    data['address'] = address;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['what_app'] = whatApp;
    data['telegram'] = telegram;
    data['messenger'] = messenger;
    data['skype'] = skype;
    data['we_chat'] = weChat;
    data['website'] = website;
    data['facebook'] = facebook;
    data['linkedin'] = linkedin;
    data['twitter'] = twitter;
    if (typeOfOrganization != null) {
      data['type_of_organization'] = typeOfOrganization!.toJson();
    }
    if (industry != null) {
      data['industry'] = industry!.toJson();
    }
    data['tax_identification_number'] = taxIdentificationNumber;
    data['number_of_staff'] = numberOfStaff;
    data['owner_name'] = ownerName;
    if (companyFiles != null) {
      data['company_files'] = companyFiles!.toJson();
    }
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}
