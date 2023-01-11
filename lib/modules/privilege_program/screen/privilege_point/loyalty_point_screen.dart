import 'package:cicgreenloan/modules/privilege_program/screen/privilege_point/point_emptystate.dart';
import 'package:cicgreenloan/widgets/privilege/privilege_point/custom_transaction_point_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/privilege/custom_shimmer_point.dart';
import '../../../wallet/controller/wallet_controller.dart';

class LoyaltyPointScreen extends StatelessWidget {
  const LoyaltyPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());
    walletController.mvpRewardTransaction();
    return Obx(
      (() => walletController.isMVPRewardTransaction.value
          ? Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const CustomShimmerPoint();
                  }),
            )
          : walletController.mvpRewardTransactionList.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                      children: walletController.mvpRewardTransactionList
                          .asMap()
                          .entries
                          .map((exchangePointTransaction) {
                    return CustomTransactionPoint(
                      exchangePointTransaction: exchangePointTransaction.value,
                    );
                  }).toList()),
                )
              : const PiointEmptyState(
                  title: 'No transaction yet!',
                  description: '',
                )),
    );
  }
}
