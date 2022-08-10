import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/widgets/bonus/custom_empty_state.dart';
import 'package:cicgreenloan/widgets/bonus/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/bonus/custom_shimmer_card_bonus.dart';

class AllTransaction extends StatefulWidget {
  final bool? isStatus;
  const AllTransaction({Key? key, this.status, this.isStatus = false})
      : super(key: key);

  final String? status;
  @override
  State<AllTransaction> createState() => _AllTransactionState();
}

class _AllTransactionState extends State<AllTransaction> {
  final bonusCon = Get.put(BonusController());

  @override
  void initState() {
    bonusCon.fetchTransationHistory(type: "all");
    bonusCon.fetchPendingTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => bonusCon.isLoadingHistory.value && bonusCon.isPending.value
          ? const Center(child: ShimmerCardBonus())
          : bonusCon.historyList.isEmpty
              ? const SingleChildScrollView(child: CustomEmptyState())
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bonusCon.pendingtransactionList.isNotEmpty
                          ? CustomTransactionCard(
                              hisStoryList: bonusCon.pendingtransactionList,
                              // isStatus: widget.isStatus,
                              title: "Pending Transactions",
                              isTitle: true,
                              isStatus: true, isPendingtransaction: true,
                            )
                          : Container(),
                      bonusCon.historyList.isNotEmpty
                          ? CustomTransactionCard(
                              hisStoryList: bonusCon.historyList,
                              isStatus: widget.isStatus,
                              title: "Transactions",
                              isTitle: true,
                            )
                          : Container(),
                      const SizedBox(height: 30.0),
                    ],
                  ),
                ),
    );
  }
}
