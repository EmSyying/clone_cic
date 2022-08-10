import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/widgets/bonus/custom_empty_state.dart';
import 'package:cicgreenloan/widgets/bonus/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/bonus/custom_shimmer_card_bonus.dart';

class ExpenseTransaction extends StatefulWidget {
  const ExpenseTransaction({Key? key}) : super(key: key);

  @override
  State<ExpenseTransaction> createState() => _ExpenseTransactionState();
}

class _ExpenseTransactionState extends State<ExpenseTransaction> {
  final bonusCon = Get.put(BonusController());

  @override
  void initState() {
    bonusCon.fetchTransationHistory(type: 'expense');
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
