import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
import 'package:cicgreenloan/modules/get_funding/models/cash_flow_model.dart';
import 'package:cicgreenloan/modules/get_funding/models/financing_purpose_model.dart';
import 'package:cicgreenloan/modules/member_directory/models/member_personal_profile.dart';

class ApplicationDetailModel {
  ApplicationDataDetail? data;

  ApplicationDetailModel({this.data});

  ApplicationDetailModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? ApplicationDataDetail.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ApplicationDataDetail {
  int? id;
  String? status;
  num? term;
  num? financialAmount;
  Optionmodel? financialPurpose;
  String? intendedDateDisbursement;
  String? reason;
  String? updatedAt;
  String? createdAt;
  int? businessPlan;
  int? articleOfIncorporation;
  int? incomeStatement;
  int? balanceSheet;
  int? cashFlowStatement;
  int? marketStudyDocs;
  int? otherDocument;
  int? companyPatentDoc;
  int? companyLicenceDoc;
  int? companyMoCCertificate;
  int? companyMAA;
  CustomerInfo? customerInfo;
  Company? company;
  String? useofFund;
  num? numberofshareholder;
  num? numberofboardmember;
  num? iscompanyraisefund,
      ismajorityshareholder,
      financialroject,
      raisefundusefor;
  num? step;

  ApplicationDataDetail(
      {this.id,
      this.status,
      this.term,
      this.financialAmount,
      this.financialPurpose,
      this.intendedDateDisbursement,
      this.reason,
      this.updatedAt,
      this.createdAt,
      this.step,
      this.articleOfIncorporation,
      this.balanceSheet,
      this.businessPlan,
      this.cashFlowStatement,
      this.incomeStatement,
      this.otherDocument,
      this.customerInfo,
      this.company,
      this.financialroject,
      this.iscompanyraisefund,
      this.ismajorityshareholder,
      this.numberofboardmember,
      this.numberofshareholder,
      this.raisefundusefor,
      this.useofFund,
      this.companyPatentDoc,
      this.companyMoCCertificate,
      this.companyLicenceDoc,
      this.companyMAA});

  ApplicationDataDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    term = json['term'];
    financialAmount = json['financial_amount'];
    financialPurpose = json['financial_purpose'] != null
        ? Optionmodel.fromJson(json['financial_purpose'])
        : null;
    useofFund = json['use_of_fund'];
    numberofshareholder = json['number_of_shareholders'];
    numberofboardmember = json['number_of_board_members'];
    iscompanyraisefund = json['is_company_raise_fund'];
    ismajorityshareholder = json['is_majority_shareholder'];
    financialroject = json['financial_project'];
    raisefundusefor = json['raise_fund_use_for'];

    intendedDateDisbursement = json['intended_date_disbursement'];
    reason = json['reason'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    step = json['step'];
    businessPlan = json['business_plan'];
    articleOfIncorporation = json['article_of_incorporation'];
    incomeStatement = json['income_statement'];
    balanceSheet = json['balance_sheet'];
    cashFlowStatement = json['cash_flow_statement'];
    marketStudyDocs = json['market_study_docs'];
    otherDocument = json['other_document'];

    customerInfo = json['customer_info'] != null
        ? CustomerInfo.fromJson(json['customer_info'])
        : null;
    companyPatentDoc = json['company_patent_doc'];
    companyLicenceDoc = json['company_licence_doc'];
    companyMoCCertificate = json['company_MoC_certificate'];
    companyMAA = json['company_MAA'];
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['term'] = term;
    data['use_of_fund'] = useofFund;
    data['number_of_shareholders'] = numberofshareholder;
    data['number_of_board_members'] = numberofboardmember;
    data['is_company_raise_fund'] = iscompanyraisefund;
    data['is_majority_shareholder'] = ismajorityshareholder;
    data['financial_project'] = financialroject;
    data['raise_fund_use_for'] = raisefundusefor;
    data['financial_amount'] = financialAmount;
    if (financialPurpose != null) {
      data['financial_purpose'] = financialPurpose!.toJson();
    }
    data['intended_date_disbursement'] = intendedDateDisbursement;
    data['reason'] = reason;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['step'] = step;
    data['business_plan'] = businessPlan;
    data['article_of_incorporation'] = articleOfIncorporation;
    data['income_statement'] = incomeStatement;
    data['balance_sheet'] = balanceSheet;
    data['cash_flow_statement'] = cashFlowStatement;
    data['market_study_docs'] = marketStudyDocs;
    data['other_document'] = otherDocument;

    if (customerInfo != null) {
      data['customer_info'] = customerInfo!.toJson();
    }
    data['company_patent_doc'] = companyPatentDoc;
    data['company_licence_doc'] = companyLicenceDoc;
    data['company_MoC_certificate'] = companyMoCCertificate;
    data['company_MAA'] = companyMAA;
    if (company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }
}


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

class Company {
  int? id;
  int? memberId;
  String? companyName;
  String? khmerName;
  FinancialPurpose? majorOfBusiness;
  String? position;
  FinancialPurpose? legalStatus;
  FinancialPurpose? registeredBusiness;
  num? companySize;
  num? numberOfBranches;
  FinancialPurpose? businessModel;
  String? capitalInvestment;
  String? yearFounded;
  num? isPrimary;
  String? companyDiagnosticReport;
  String? companyMilestones;
  String? companyLogo;
  // Null serviceImages;
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
  Optionmodel? typeOfOrganization;
  Optionmodel? industry;
  String? taxIdentificationNumber;
  num? numberOfStaff;
  String? ownerName;
  CompanyFiles? companyFiles;

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
      // this.serviceImages,
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
    // serviceImages = json['service_images'];
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
        ? Optionmodel.fromJson(json['type_of_organization'])
        : null;
    industry = json['industry'] != null
        ? Optionmodel.fromJson(json['industry'])
        : null;
    taxIdentificationNumber = json['tax_identification_number'];
    numberOfStaff = json['number_of_staff'];
    ownerName = json['owner_name'];
    if (json['company_files'] != null) {
      companyFiles = CompanyFiles.fromJson(json['company_files']);
    }
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
    // data['service_images'] = this.serviceImages;
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

class CompanyFiles {
  List<FileForm>? companyPatentDoc;
  List<FileForm>? companyLicenceDoc;
  List<FileForm>? companyMoCCertificate;

  CompanyFiles({
    this.companyPatentDoc,
    this.companyLicenceDoc,
    this.companyMoCCertificate,
  });

  CompanyFiles.fromJson(Map<String, dynamic> json) {
    if (json['company_patent_doc'] != null) {
      companyPatentDoc = <FileForm>[];
      json['company_patent_doc'].forEach((v) {
        companyPatentDoc!.add(FileForm.fromJson(v));
      });
    }
    if (json['company_licence_doc'] != null) {
      companyLicenceDoc = <FileForm>[];
      json['company_licence_doc'].forEach((v) {
        companyLicenceDoc!.add(FileForm.fromJson(v));
      });
    }
    if (json['company_MoC_certificate'] != null) {
      companyMoCCertificate = <FileForm>[];
      json['company_MoC_certificate'].forEach((v) {
        companyMoCCertificate!.add(FileForm.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (companyPatentDoc != null) {
      data['company_patent_doc'] =
          companyPatentDoc!.map((v) => v.toJson()).toList();
    }
    if (companyLicenceDoc != null) {
      data['company_licence_doc'] =
          companyLicenceDoc!.map((v) => v.toJson()).toList();
    }
    if (companyMoCCertificate != null) {
      data['company_MoC_certificate'] =
          companyMoCCertificate!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DebtEqityData {
  int? id;
  String? status;
  Optionmodel? productType;
  int? countDownSaveDraft;
  int? duration;
  int? financialAmount;
  FinancialPurpose? financialPurpose;
  String? intendedDateDisbursement;
  String? reason;
  int? step;
  String? updatedAt;
  String? createdAt;
  int? businessPlan;
  int? incomeStatement;
  int? balanceSheet;
  int? cashFlowStatement;
  int? otherDocument;
  int? companyPatentDoc;
  int? companyLicenceDoc;
  int? companyMoCCertificate;
  int? companyMAA;
  CustomerInfo? customerInfo;
  Company? company;

  DebtEqityData(
      {this.id,
      this.status,
      this.productType,
      this.countDownSaveDraft,
      this.duration,
      this.financialAmount,
      this.financialPurpose,
      this.intendedDateDisbursement,
      this.reason,
      this.step,
      this.updatedAt,
      this.createdAt,
      this.businessPlan,
      this.incomeStatement,
      this.balanceSheet,
      this.cashFlowStatement,
      this.otherDocument,
      this.companyPatentDoc,
      this.companyLicenceDoc,
      this.companyMoCCertificate,
      this.companyMAA,
      this.customerInfo,
      this.company});

  DebtEqityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    productType = json['product_type'] != null
        ? Optionmodel.fromJson(json['product_type'])
        : null;
    countDownSaveDraft = json['count_down_save_draft'];
    duration = json['duration'];
    financialAmount = json['financial_amount'];
    financialPurpose = json['financial_purpose'] != null
        ? FinancialPurpose.fromJson(json['financial_purpose'])
        : null;
    intendedDateDisbursement = json['intended_date_disbursement'];
    reason = json['reason'];
    step = json['step'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    businessPlan = json['business_plan'];
    incomeStatement = json['income_statement'];
    balanceSheet = json['balance_sheet'];
    cashFlowStatement = json['cash_flow_statement'];
    otherDocument = json['other_document'];
    companyPatentDoc = json['company_patent_doc'];
    companyLicenceDoc = json['company_licence_doc'];
    companyMoCCertificate = json['company_MoC_certificate'];
    companyMAA = json['company_MAA'];
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
    if (productType != null) {
      data['product_type'] = productType!.toJson();
    }
    data['count_down_save_draft'] = countDownSaveDraft;
    data['duration'] = duration;
    data['financial_amount'] = financialAmount;
    if (financialPurpose != null) {
      data['financial_purpose'] = financialPurpose!.toJson();
    }
    data['intended_date_disbursement'] = intendedDateDisbursement;
    data['reason'] = reason;
    data['step'] = step;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['business_plan'] = businessPlan;
    data['income_statement'] = incomeStatement;
    data['balance_sheet'] = balanceSheet;
    data['cash_flow_statement'] = cashFlowStatement;
    data['other_document'] = otherDocument;
    data['company_patent_doc'] = companyPatentDoc;
    data['company_licence_doc'] = companyLicenceDoc;
    data['company_MoC_certificate'] = companyMoCCertificate;
    data['company_MAA'] = companyMAA;
    if (customerInfo != null) {
      data['customer_info'] = customerInfo!.toJson();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }
}

class ProductType {
  num? id;
  String? productName;
  String? productType;

  ProductType({this.id, this.productName, this.productType});

  ProductType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productType = json['product_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_name'] = productName;
    data['product_type'] = productType;
    return data;
  }
}
