import 'package:cicgreenloan/widgets/bonus/custom_empty_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/bonus/custom_shimmer_card_bonus.dart';
import '../../../widgets/wallets/custom_wallet_transaction.dart';
import '../../wallet/controller/wallet_controller.dart';

class IncomeTransaction extends StatefulWidget {
  const IncomeTransaction({Key? key}) : super(key: key);

  @override
  State<IncomeTransaction> createState() => _IncomeTransactionState();
}

class _IncomeTransactionState extends State<IncomeTransaction> {
  final _walletController = Get.put(WalletController());
  @override
  void initState() {
    _walletController.getIncomeTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _walletController.loadingfetchIncome.value
          ? const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Center(child: ShimmerCardBonus()),
            )
          : _walletController.incomeTransactionList.isEmpty
              ? Container(
                  color: Colors.white,
                  child: const SingleChildScrollView(
                    child: CustomEmptyState(),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: CustomWalletTransaction(
                      walletTransaction:
                          _walletController.incomeTransactionList,
                    ),
                  ),
                ),
    );
  }
}
