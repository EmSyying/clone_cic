import 'package:cicgreenloan/widgets/bonus/custom_empty_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/bonus/custom_shimmer_card_bonus.dart';
import '../../../widgets/wallets/custom_wallet_transaction.dart';
import '../../wallet/controller/wallet_controller.dart';

class ExpenseTransaction extends StatefulWidget {
  const ExpenseTransaction({Key? key}) : super(key: key);

  @override
  State<ExpenseTransaction> createState() => _ExpenseTransactionState();
}

class _ExpenseTransactionState extends State<ExpenseTransaction> {
  final _walletController = Get.put(WalletController());

  @override
  void initState() {
    _walletController.getExpenseTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _walletController.loadingfetchExpense.value
          ? const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Center(child: ShimmerCardBonus()),
            )
          : _walletController.expenseTransactionList.isEmpty
              ? Container(
                  color: Colors.white,
                  child: const SingleChildScrollView(
                    child: CustomEmptyState(),
                  ),
                )
              : CustomWalletTransaction(
                  walletTransaction: _walletController.expenseTransactionList,
                ),
    );
  }
}
