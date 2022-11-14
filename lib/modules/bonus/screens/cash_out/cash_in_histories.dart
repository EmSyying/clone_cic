import 'package:cicgreenloan/widgets/bonus/custom_empty_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/bonus/custom_shimmer_card_bonus.dart';
import '../../../../widgets/wallets/custom_wallet_transaction.dart';
import '../../../wallet/controller/wallet_controller.dart';

class CashInHistories extends StatelessWidget {
  const CashInHistories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());
    walletController.getCashinTransaction();
    return Obx(
      () => walletController.loadingfetchCashinTransaction.value
          ? SizedBox(
              height: MediaQuery.of(context).size.height * 0.50,
              width: double.infinity,
              child: const ShimmerCardBonus())
          : walletController.cashinTransactionList.isEmpty
              ? const CustomEmptyState()
              : CustomWalletTransaction(
                  walletTransaction: walletController.cashinTransactionList,
                ),
    );
  }
}
