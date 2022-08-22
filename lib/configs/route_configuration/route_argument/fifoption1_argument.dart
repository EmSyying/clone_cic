import '../../../modules/investment_module/controller/investment_controller.dart';
import '../../../modules/investment_module/model/fif_contract_option/fif_contract_option.dart';

class FIFOption1Arg {
  final int? id;
  final PaymentDate? paymentDate;
  final List<FIFoptionModel>? options;

  FIFOption1Arg({this.id, this.paymentDate, this.options});
}
