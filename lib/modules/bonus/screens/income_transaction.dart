import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/widgets/bonus/custom_empty_state.dart';
import 'package:cicgreenloan/widgets/bonus/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/bonus/custom_shimmer_card_bonus.dart';

class IncomeTransaction extends StatefulWidget {
  const IncomeTransaction({Key? key}) : super(key: key);

  @override
  State<IncomeTransaction> createState() => _IncomeTransactionState();
}

class _IncomeTransactionState extends State<IncomeTransaction> {
  final bonusCon = Get.put(BonusController());

  @override
  void initState() {
    bonusCon.fetchTransationHistory(type: 'income');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => bonusCon.isLoadingHistory.value
          ? const Center(child: ShimmerCardBonus())
          : bonusCon.historyList.isEmpty
              ? const SingleChildScrollView(child: CustomEmptyState())
              : CustomTransactionCard(hisStoryList: bonusCon.historyList),
    );
  }
}
