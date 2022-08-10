import 'package:cicgreenloan/modules/get_funding/models/file_model.dart';
import 'package:cicgreenloan/modules/get_funding/models/financing_purpose_model.dart';

class Company {
  int? id;
  String? companyName;
  String? companyAddress;
  int? yearOfEstablishment;
  FinancialPurpose? typeOfOrganization;
  FinancialPurpose? industry;
  String? taxIdentificationNumber;
  int? numberOfStaff;
  String? ownerName;
  String? productOrService;
  int? numberOfShareholders;
  int? numberOfBoardMembers;
  int? isCompanyRaiseFund;
  int? isMajorityShareholder;
  int? financialProject;
  FinancialPurpose? raiseFundUseFor;
  FilesModel? files;

  Company(
      {this.id,
      this.companyName,
      this.companyAddress,
      this.yearOfEstablishment,
      this.typeOfOrganization,
      this.industry,
      this.taxIdentificationNumber,
      this.numberOfStaff,
      this.ownerName,
      this.productOrService,
      this.numberOfShareholders,
      this.numberOfBoardMembers,
      this.isCompanyRaiseFund,
      this.isMajorityShareholder,
      this.financialProject,
      this.raiseFundUseFor,
      this.files});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    companyAddress = json['company_address'];
    yearOfEstablishment = json['year_of_establishment'];
    typeOfOrganization = json['type_of_organization'] != null
        ? FinancialPurpose.fromJson(json['type_of_organization'])
        : null;
    industry = json['industry'] != null
        ? FinancialPurpose.fromJson(json['industry'])
        : null;
    taxIdentificationNumber = json['tax_identification_number'];
    numberOfStaff = json['number_of_staff'];
    ownerName = json['owner_name'];
    productOrService = json['product_or_service'];
    numberOfShareholders = json['number_of_shareholders'];
    numberOfBoardMembers = json['number_of_board_members'];
    isCompanyRaiseFund = json['is_company_raise_fund'];
    isMajorityShareholder = json['is_majority_shareholder'];
    financialProject = json['financial_project'];
    raiseFundUseFor = json['raise_fund_use_for'] != null
        ? FinancialPurpose.fromJson(json['raise_fund_use_for'])
        : null;
    files = json['files'] != null ? FilesModel.fromJson(json['files']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = companyName;
    data['company_address'] = companyAddress;
    data['year_of_establishment'] = yearOfEstablishment;
    if (typeOfOrganization != null) {
      data['type_of_organization'] = typeOfOrganization!.toJson();
    }
    if (industry != null) {
      data['industry'] = industry!.toJson();
    }
    data['tax_identification_number'] = taxIdentificationNumber;
    data['number_of_staff'] = numberOfStaff;
    data['owner_name'] = ownerName;
    data['product_or_service'] = productOrService;
    data['number_of_shareholders'] = numberOfShareholders;
    data['number_of_board_members'] = numberOfBoardMembers;
    data['is_company_raise_fund'] = isCompanyRaiseFund;
    data['is_majority_shareholder'] = isMajorityShareholder;
    data['financial_project'] = financialProject;
    if (raiseFundUseFor != null) {
      data['raise_fund_use_for'] = raiseFundUseFor!.toJson();
    }
    if (files != null) {
      data['files'] = files!.toJson();
    }
    return data;
  }
}
