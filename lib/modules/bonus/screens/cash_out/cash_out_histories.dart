import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/widgets/bonus/custom_empty_state.dart';
import 'package:cicgreenloan/widgets/bonus/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/bonus/custom_shimmer_card_bonus.dart';

class CashoutHistories extends StatelessWidget {
  CashoutHistories({Key? key}) : super(key: key);
  final bonusCon = Get.put(BonusController());
  @override
  Widget build(BuildContext context) {
    bonusCon.fetchTransationHistory(type: 'cash-out');
    return Obx(
      () => bonusCon.isLoadingHistory.value
          ? SizedBox(
              height: MediaQuery.of(context).size.height * 0.50,
              width: double.infinity,
              child: const ShimmerCardBonus())
          : bonusCon.cashOutTransactionList.isEmpty
              ? const CustomEmptyState()
              : CustomTransactionCard(
                  hisStoryList: bonusCon.cashOutTransactionList,
                  isStatus: true,
                ),
    );
  }
}
