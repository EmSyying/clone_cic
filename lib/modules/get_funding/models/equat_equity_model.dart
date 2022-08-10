import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
import 'package:equatable/equatable.dart';

class EquityModel {
  Step1EquityModel? step1 = Step1EquityModel();
  Step2EquityModel? step2 = Step2EquityModel();
  Step3EquityModel? step3 = Step3EquityModel();
  EquityModel({this.step1, this.step2, this.step3});
}

// ignore: must_be_immutable
class Step1EquityModel extends Equatable {
  num? financingAmount = 0.0;
  String? intendedDate = '';
  String? useOfFund = '';
  Step1EquityModel({this.financingAmount, this.intendedDate, this.useOfFund});

  @override
  List<Object?> get props => [financingAmount, intendedDate, useOfFund];
}

// ignore: must_be_immutable
class Step2EquityModel extends Equatable {
  String? companyIndex = '';
  String? companyName = '';
  String? address = '';
  String? yearOfEstablishment = '';
  Optionmodel? typeOfOrganization = Optionmodel();
  String? taxIdentificationNumber = '';
  Optionmodel? industry = Optionmodel();
  String? numberOfStaff = '';
  String? ownerName = '';
  String? productSevice = '';
  int? companyPatentDoc = 0;
  int? companyMocCertificate = 0;
  int? companyLicence = 0;
  int? companyMemorandum = 0;

  Step2EquityModel(
      {this.address,
      this.companyIndex,
      this.companyName,
      this.industry,
      this.numberOfStaff,
      this.ownerName,
      this.productSevice,
      this.taxIdentificationNumber,
      this.typeOfOrganization,
      this.yearOfEstablishment,
      this.companyLicence,
      this.companyMemorandum,
      this.companyMocCertificate,
      this.companyPatentDoc});

  @override
  List<Object?> get props => [
        companyIndex,
        address,
        companyName,
        yearOfEstablishment,
        typeOfOrganization,
        taxIdentificationNumber,
        industry,
        numberOfStaff,
        ownerName,
        productSevice
      ];
}

// ignore: must_be_immutable
class Step3EquityModel extends Equatable {
  num? numberOfShareHolders = 0;
  num? numberOfBoardMembers = 0;
  num? haveTheConsenus = 0;
  num? purposeOfFund = 0;
  num? areYouTheMajorityShareholder = 0;
  num? havefinancial = 0;

  num? businessPlan = 0;
  num? articleOfIncorporation = 0;
  num? incomeStatement = 0;
  num? balanceSheet = 0;
  num? cashFlowStatement = 0;
  num? marketStudy = 0;
  num? otherDocuments = 0;

  Step3EquityModel(
      {this.areYouTheMajorityShareholder,
      this.articleOfIncorporation,
      this.balanceSheet,
      this.businessPlan,
      this.cashFlowStatement,
      this.haveTheConsenus,
      this.havefinancial,
      this.incomeStatement,
      this.marketStudy,
      this.numberOfBoardMembers,
      this.numberOfShareHolders,
      this.otherDocuments,
      this.purposeOfFund});

  @override
  List<Object?> get props => [
        numberOfShareHolders,
        numberOfBoardMembers,
        haveTheConsenus,
        havefinancial,
        purposeOfFund,
        areYouTheMajorityShareholder,
        businessPlan,
        articleOfIncorporation,
        incomeStatement,
        balanceSheet,
        cashFlowStatement,
        marketStudy,
        otherDocuments
      ];
}
