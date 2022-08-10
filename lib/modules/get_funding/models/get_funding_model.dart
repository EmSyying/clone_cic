import 'package:cicgreenloan/modules/get_funding/models/application_detail.dart';
import 'package:cicgreenloan/modules/get_funding/models/financing_purpose_model.dart';

class GetFundingModel {
  int? id;
  String? status;
  int? term;
  int? financialAmount;
  FinancialPurpose? financialPurpose;
  String? intendedDateDisbursement;
  String? updatedAt;
  String? useOfFund;
  String? createdAt;
  CustomerInfo? customerInfo;
  Company? company;

  GetFundingModel(
      {this.id,
      this.status,
      this.term,
      this.financialAmount,
      this.financialPurpose,
      this.intendedDateDisbursement,
      this.updatedAt,
      this.createdAt,
      this.customerInfo,
      this.company,
      useOfFund});

  GetFundingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    term = json['term'];
    useOfFund = json['use_of_fund'];
    financialAmount = json['financial_amount'];
    financialPurpose = json['financial_purpose'] != null
        ? FinancialPurpose.fromJson(json['financial_purpose'])
        : null;
    intendedDateDisbursement = json['intended_date_disbursement'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    customerInfo = json['customer_info'] != null
        ? CustomerInfo.fromJson(json['customer_info'])
        : null;
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['use_of_fund'] = useOfFund;
    data['status'] = status;
    data['term'] = term;
    data['financial_amount'] = financialAmount;
    if (financialPurpose != null) {
      data['financial_purpose'] = financialPurpose!.toJson();
    }
    data['intended_date_disbursement'] = intendedDateDisbursement;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    if (customerInfo != null) {
      data['customer_info'] = customerInfo!.toJson();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }
}
