import '../../../modules/investment_module/model/fif_application/fif_application.dart';

class RenewalArg {
  final String? annually;
  final num? id;
  final String? investAmount;
  final String? interestEarned;
  final FiFApplicationDetailModel? fiFApplicationModel;
  final String? accountName;
  final String? contractCode;

  RenewalArg(
      {this.annually,
      this.id,
      this.investAmount,
      this.interestEarned,
      this.fiFApplicationModel,
      this.accountName,
      this.contractCode});
}
