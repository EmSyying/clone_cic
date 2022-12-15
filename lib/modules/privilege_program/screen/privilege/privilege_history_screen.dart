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
        child: priviegeCont.isLoadingHistory.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Past transactions ',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff848F92),
                          fontSize: 14,
                        ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Column(
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
    );
  }
}
