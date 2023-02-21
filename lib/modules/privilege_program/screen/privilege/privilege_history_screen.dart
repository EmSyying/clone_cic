import 'package:cicgreenloan/modules/privilege_program/controller/privilege_controller.dart';
import 'package:cicgreenloan/widgets/privilege/privilege_point/custom_recent_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/bonus/custom_empty_state.dart';
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
            : priviegeCont.privilegeHistoryList.isNotEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Past transactions',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
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
                              (history) => history.value.paymentType == 'cash'
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16.0),
                                      child: CustomCardHistoryPri(
                                        shopName: history.value.shopName,
                                        code: history.value.code,
                                        paymentDate: history.value.paymentDate,
                                        amount: history.value.amount,
                                        image: history.value.thumbnail,
                                      ),
                                    )
                                  : CustomRecentCard(
                                      margin: const EdgeInsets.only(bottom: 15),
                                      label: history.value.label,
                                      shopName: history.value.shopName,
                                      code: history.value.code,
                                      description: history.value.description,
                                      date: history.value.paymentDate,
                                      shopLogo: history.value.thumbnail,
                                      id: history.value.id,
                                      pointAmount: history.value.amount
                                      // recentActivities: RecentActivities(
                                      //     label: history.value.label,
                                      //     shopName: history.value.shopName,
                                      //     code: history.value.code,
                                      //     description:
                                      //         history.value.description,
                                      //     date: history.value.paymentDate,
                                      //     amount: history.value.amount,
                                      //     shopLogo: history.value.thumbnail,
                                      //     id: history.value.id,
                                      //     pointAmount: history.value.amount
                                      // ),
                                      ),
                            )
                            .toList(),
                      ),
                    ],
                  )
                : const CustomEmptyState(
                    colors: true,
                    title: 'No History',
                    description: '',
                  ),
      ),
    );
  }
}
