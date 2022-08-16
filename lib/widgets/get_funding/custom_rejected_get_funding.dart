import 'package:cicgreenloan/widgets/get_funding/custom_application_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/get_funding/controller/equity_investment_controller.dart';
import '../../modules/get_funding/models/appliication_card_model.dart';
import '../bonus/custom_empty_state.dart';

class CustomRejectedGetFunding extends StatelessWidget {
  final List<ApplicationData>? rejectedList;

  const CustomRejectedGetFunding({
    Key? key,
    this.rejectedList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final equityCon = Get.put(EquityInvestmentController());
    return equityCon.equityApplicationRejectedtList.isNotEmpty
        ? ApplicationList(
            applicationList: equityCon.equityApplicationRejectedtList,
          )
        : const CustomEmptyState(
            title: 'No Rejected',
            description: 'It seems you have no rejected yet',
          );
  }
}
