import 'package:cicgreenloan/modules/privilege_program/controller/privilege_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/privilege/privilege/custom_card_history_pri.dart';

class PrivilegeHistory extends StatelessWidget {
  const PrivilegeHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final priviegeCont = Get.put(PrivilegeController());
    priviegeCont.onFetchPrivilegeHistory();
    return Obx(
      () => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              priviegeCont.isLoadingHistory.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: priviegeCont.privilegeHistoryList
                          .asMap()
                          .entries
                          .map(
                            (history) => Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: CustomCardHistoryPri(
                                shopName: history.value.shopName,
                                code: history.value.code,
                                paymentDate: history.value.paymentDate,
                                amount: history.value.amount,
                                image: history.value.thumbnail,
                              ),
                            ),
                          )
                          .toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
