import 'package:cicgreenloan/widgets/privilege/privilege_point/custom_transaction_point_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../wallet/controller/wallet_controller.dart';

class LoyaltyPointScreen extends StatelessWidget {
  const LoyaltyPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());
    walletController.mvpRewardTransaction();
    return Obx(
      (() => walletController.isMVPRewardTransaction.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                  children: walletController.mvpRewardTransactionList
                      .asMap()
                      .entries
                      .map((exchangePointTransaction) {
                return CustomTransactionPoint(
                  exchangePointTransaction: exchangePointTransaction.value,
                );
              }).toList()),
            )),
    );
  }
}
