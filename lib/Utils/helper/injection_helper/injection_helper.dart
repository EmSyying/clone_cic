import 'package:cicgreenloan/modules/get_funding/controller/debt_investment_controller.dart';
import 'package:cicgreenloan/modules/get_funding/controller/equity_investment_controller.dart';
import 'package:get/get.dart';

import '../../../modules/investment_module/controller/investment_controller.dart';
import '../../../modules/member_directory/controllers/customer_controller.dart';
import '../../../modules/member_directory/controllers/member_controller.dart';
import '../../../utils/select_address/select_address_controller.dart';
import '../../option_controller/option_controller.dart';

class InjectionHelper {
  static final investmentController = Get.put(PriceController());
  static final equityInvestmentController =
      Get.put(EquityInvestmentController());
  static final debtInvestmentController = Get.put(DebtInvestmentController());
  static final memberController = Get.put(MemberController());
  static final customerController = Get.put(CustomerController());
  static final optionController = Get.put(DocumentCategory());
  static final requestLoanController = Get.put(RequestLoanController());
}
