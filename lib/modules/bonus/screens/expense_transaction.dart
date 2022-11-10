import 'package:cicgreenloan/widgets/bonus/custom_empty_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/bonus/custom_shimmer_card_bonus.dart';
import '../../../widgets/wallets/custom_transaction_card.dart';
import '../../wallet/controller/wallet_controller.dart';
import '../../wallet/screen/wallet_transaction_popup_detail.dart';

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
              ? const SingleChildScrollView(
                  child: CustomEmptyState(),
                )
              : ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) => WalletTransactionCard(
                    ontap: () {
                      _walletController
                          .onFetchWalletTransactionDetail(
                              _walletController
                                  .expenseTransactionList[index].id!,
                              _walletController
                                  .expenseTransactionList[index].model!)
                          .then(
                            (value) =>
                                WalletTran.transactionDetail(context, value),
                          );
                    },
                    transactionModel:
                        _walletController.expenseTransactionList[index],
                  ),
                  itemCount: _walletController.expenseTransactionList.length,
                  separatorBuilder: (_, __) => const SizedBox.shrink(),
                ),
    );
  }
}
