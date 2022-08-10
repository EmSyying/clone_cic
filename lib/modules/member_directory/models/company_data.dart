import 'package:cicgreenloan/modules/get_funding/models/cash_flow_model.dart';
import 'package:cicgreenloan/modules/get_funding/models/financing_purpose_model.dart';

class CompanyModels {
  List<CompanyData>? data;

  CompanyModels({this.data});

  CompanyModels.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CompanyData>[];
      json['data'].forEach((v) {
        data!.add(CompanyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompanyData {
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
  FinancialPurpose? typeOfOrganization;
  FinancialPurpose? industry;
  String? taxIdentificationNumber;
  int? numberOfStaff;
  String? ownerName;
  CompanyFiles? companyFiles;

  CompanyData(
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

  CompanyData.fromJson(Map<String, dynamic> json) {
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
    companySize = json['company_size'].runtimeType == String &&
            json['company_size'].toString().isEmpty
        ? int.tryParse(json['company_size']) ?? 0
        : json['company_size'];
    numberOfBranches = json['number_of_branches'].runtimeType == String &&
            json['number_of_branches'].toString().isEmpty
        ? int.tryParse(json['number_of_branches']) ?? 0
        : json['number_of_branches'];

    businessModel = json['business_model'] != null
        ? FinancialPurpose.fromJson(json['business_model'])
        : null;
    capitalInvestment = json['capital_investment'];
    yearFounded = json['year_founded'];

    isPrimary = json['is_primary'].runtimeType == String &&
            json['is_primary'].toString().isEmpty
        ? int.tryParse(json['is_primary']) ?? 0
        : json['is_primary'];
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
        ? FinancialPurpose.fromJson(json['type_of_organization'])
        : null;
    industry = json['industry'] != null
        ? FinancialPurpose.fromJson(json['industry'])
        : null;
    taxIdentificationNumber = json['tax_identification_number'];
    numberOfStaff = json['number_of_staff'];
    ownerName = json['owner_name'];

    ///
    if (json['company_files'] != null && json['company_files'].isNotEmpty) {
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
  List<FileForm>? businessPlan;
  List<FileForm>? cashFlowStatement;
  List<FileForm>? otherDocument;
  List<FileForm>? incomeStatement;
  List<FileForm>? balanceSheet;
  List<FileForm>? companyPatentDoc;
  List<FileForm>? companyLicenceDoc;
  List<FileForm>? companyMoCCertificate;

  CompanyFiles(
      {this.businessPlan,
      this.cashFlowStatement,
      this.otherDocument,
      this.incomeStatement,
      this.balanceSheet,
      this.companyPatentDoc,
      this.companyLicenceDoc,
      this.companyMoCCertificate});

  CompanyFiles.fromJson(Map<String, dynamic> json) {
    if (json['business_plan'] != null) {
      businessPlan = <FileForm>[];
      json['business_plan'].forEach((v) {
        businessPlan!.add(FileForm.fromJson(v));
      });
    }
    if (json['cash_flow_statement'] != null) {
      cashFlowStatement = <FileForm>[];
      json['cash_flow_statement'].forEach((v) {
        cashFlowStatement!.add(FileForm.fromJson(v));
      });
    }
    if (json['other_document'] != null) {
      otherDocument = <FileForm>[];
      json['other_document'].forEach((v) {
        otherDocument!.add(FileForm.fromJson(v));
      });
    }
    if (json['income_statement'] != null) {
      incomeStatement = <FileForm>[];
      json['income_statement'].forEach((v) {
        incomeStatement!.add(FileForm.fromJson(v));
      });
    }
    if (json['balance_sheet'] != null) {
      balanceSheet = <FileForm>[];
      json['balance_sheet'].forEach((v) {
        balanceSheet!.add(FileForm.fromJson(v));
      });
    }
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
    if (businessPlan != null) {
      data['business_plan'] = businessPlan!.map((v) => v.toJson()).toList();
    }
    if (cashFlowStatement != null) {
      data['cash_flow_statement'] =
          cashFlowStatement!.map((v) => v.toJson()).toList();
    }
    if (otherDocument != null) {
      data['other_document'] = otherDocument!.map((v) => v.toJson()).toList();
    }
    if (incomeStatement != null) {
      data['income_statement'] =
          incomeStatement!.map((v) => v.toJson()).toList();
    }
    if (balanceSheet != null) {
      data['balance_sheet'] = balanceSheet!.map((v) => v.toJson()).toList();
    }
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
