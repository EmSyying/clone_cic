import 'package:cicgreenloan/Utils/helper/option_model/option_model.dart';
import 'package:cicgreenloan/modules/get_funding/models/loan_option.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class DebtModel extends Equatable {
  DebtStep1Model? debtStep1Model;
  DebtStep2Model? debtStep2Model;
  DebtStep3Model? debtStep3Model;
  DebtStep4Model? debtStep4Model;
  DebtModel({
    this.debtStep1Model,
    this.debtStep2Model,
    this.debtStep3Model,
    this.debtStep4Model,
  });
  @override
  List<Object?> get props =>
      [debtStep1Model, debtStep2Model, debtStep3Model, debtStep4Model];
}

// ignore: must_be_immutable
class DebtStep1Model extends Equatable {
  Optionmodel? gender;
  num? genIndex;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? dateOfBirth;
  int? addIndex;
  // Address? address;
  String? currHouseNo;
  String? currStreetNo;
  String? perHouseNo;
  String? perStreetNo;
  String? city;
  String? dis;
  String? com;
  String? vil;
  String? perCity;
  String? perDis;
  String? perCom;
  String? perVil;

  DebtStep1Model(
      {this.gender,
      this.genIndex,
      this.fullName,
      // this.address,
      this.dateOfBirth,
      this.email,
      this.currHouseNo,
      this.currStreetNo,
      this.perHouseNo,
      this.perStreetNo,
      this.city,
      this.dis,
      this.com,
      this.vil,
      this.perCity,
      this.perDis,
      this.perCom,
      this.perVil,
      this.addIndex,
      this.phoneNumber});
  @override
  List<Object?> get props => [
        gender,
        genIndex,
        fullName,
        // address,
        dateOfBirth,
        email,
        currHouseNo,
        currStreetNo,
        perHouseNo,
        perStreetNo,
        city,
        dis,
        com,
        vil,
        perCity,
        perDis,
        perCom,
        perVil,
        addIndex,
        phoneNumber
      ];
}

// ignore: must_be_immutable
class DebtStep2Model extends Equatable {
  num? financingAmount;
  num? term;
  Optionmodel? financingPurpose;
  Option? productType;
  String? intendedDate;
  String? addNewFinancingPurpose;
  DebtStep2Model(
      {this.financingAmount,
      this.financingPurpose,
      this.term,
      this.productType,
      this.intendedDate,
      this.addNewFinancingPurpose});

  @override
  List<Object?> get props =>
      [financingAmount, financingPurpose, term, intendedDate, productType];
}

// ignore: must_be_immutable
class DebtStep3Model extends Equatable {
  String? companyIndex = '';
  String? companyName = '';
  String? address = '';
  String? yearOfEstablishment = '';
  Optionmodel? typeOfOrganization = Optionmodel();
  String? taxIdentificationNumber = '';
  Optionmodel? industry = Optionmodel();
  String? numberOfStaff = "";
  String? ownerName = '';
  String? productSevice = '';

  int? patentDoc = 0;
  int? mocCertificate = 0;
  int? licenceDoc = 0;
  int? memorandum = 0;

  DebtStep3Model(
      {this.address,
      this.companyIndex,
      this.companyName,
      this.industry,
      this.licenceDoc,
      this.mocCertificate,
      this.numberOfStaff,
      this.ownerName,
      this.patentDoc,
      this.memorandum,
      this.productSevice,
      this.taxIdentificationNumber,
      this.typeOfOrganization,
      this.yearOfEstablishment});
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
        patentDoc,
        mocCertificate,
        licenceDoc,
        productSevice
      ];
}

// ignore: must_be_immutable
class DebtStep4Model extends Equatable {
  int? incomeStatement;
  int? balanceSheet;
  int? cashFlowStatement;
  int? businessPlan;
  int? otherDocuments;
  DebtStep4Model({
    this.incomeStatement,
    this.balanceSheet,
    this.cashFlowStatement,
    this.businessPlan,
    this.otherDocuments,
  });
  @override
  List<Object?> get props => [
        incomeStatement,
        businessPlan,
        cashFlowStatement,
        businessPlan,
        otherDocuments,
      ];
}
