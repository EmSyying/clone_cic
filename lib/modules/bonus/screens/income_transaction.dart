import 'package:cicgreenloan/widgets/bonus/custom_empty_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/bonus/custom_shimmer_card_bonus.dart';
import '../../../widgets/wallets/custom_transaction_card.dart';
import '../../wallet/controller/wallet_controller.dart';
import '../../wallet/screen/wallet_transaction_popup_detail.dart';

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
                      debugPrint(
                          "transaction type:${_walletController.incomeTransactionList[index].transactionType!}");
                      _walletController
                          .onFetchWalletTransactionDetail(
                              _walletController
                                  .incomeTransactionList[index].id!,
                              _walletController
                                  .incomeTransactionList[index].model!)
                          .then(
                            (value) =>
                                WalletTran.transactionDetail(context, value),
                          );
                    },
                    transactionModel:
                        _walletController.incomeTransactionList[index],
                  ),
                  itemCount: _walletController.incomeTransactionList.length,
                  separatorBuilder: (_, __) => const SizedBox.shrink(),
                ),
    );
  }
}
