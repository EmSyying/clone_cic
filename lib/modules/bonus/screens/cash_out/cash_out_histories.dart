import 'package:cicgreenloan/widgets/bonus/custom_empty_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/bonus/custom_shimmer_card_bonus.dart';
import '../../../../widgets/wallets/custom_wallet_transaction.dart';
import '../../../wallet/controller/wallet_controller.dart';

class CashoutHistories extends StatelessWidget {
  CashoutHistories({Key? key}) : super(key: key);
  final _walletController = Get.put(WalletController());
  @override
  Widget build(BuildContext context) {
    _walletController.getCashoutTransaction();
    return Obx(
      () => _walletController.loadingfetchCashoutTransaction.value
          ? const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Center(child: ShimmerCardBonus()),
            )
          : _walletController.cashoutTransactionList.isEmpty
              ? const SingleChildScrollView(
                  child: CustomEmptyState(),
                )
              : CustomWalletTransaction(
                  walletTransaction: _walletController.cashoutTransactionList,
                ),
    );
  }
}
