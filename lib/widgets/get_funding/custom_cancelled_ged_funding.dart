import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/get_funding/controller/equity_investment_controller.dart';
import '../bonus/custom_empty_state.dart';
import 'custom_application_list.dart';
import 'custom_shimmer_card_get_funding.dart';

class CustomCancelledGetFunding extends StatelessWidget {
  const CustomCancelledGetFunding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final equityCon = Get.put(EquityInvestmentController());
    equityCon.getEquityAndDebtRejectedAndCancelled('cancelled');
    return Obx(
      () => equityCon.isLoadingStatus.value
          ? () {
              return const Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                ),
                child: CustomShimmerCardGetFunding(),
              );
            }()
          : equityCon.equityApplicationRejectedtList.isNotEmpty
              ? SingleChildScrollView(
                  child: ApplicationList(
                    fromPage: 'histories',
                    applicationList: equityCon.equityApplicationRejectedtList,
                  ),
                )
              : const CustomEmptyState(
                  title: 'No Cancelled',
                  description: 'It seems you have no cancelled yet',
                ),
    );

    // final contro = Get.put(DebtInvestmentController());
    // return contro.applicationCardList.isEmpty
    //     ? SingleChildScrollView(
    //         padding: const EdgeInsets.only(bottom: 30),
    //         child: Column(
    //           children: contro.applicationCardList.asMap().entries.map((e) {
    //             return Padding(
    //               padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
    //               child: ApplicationList(
    //                 listTitleColor: const Color(0xff464646),
    //                 applicationList: contro.applicationCardList,
    //               ),
    //             );
    //           }).toList(),
    //         ),
    //       )
    //     : const CustomEmptyState(
    //         title: 'No Cancelled',
    //         description: 'It seems you have no Cancelled yet',
    //       );
  }
}
