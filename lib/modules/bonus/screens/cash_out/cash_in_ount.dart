import 'package:cicgreenloan/widgets/bonus/custom_empty_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/bonus/custom_shimmer_card_bonus.dart';
import '../../../../widgets/wallets/custom_transaction_card.dart';
import '../../../wallet/controller/wallet_controller.dart';
import '../../../wallet/screen/wallet_transaction_popup_detail.dart';

class CashInOutTransaction extends StatelessWidget {
  CashInOutTransaction({Key? key}) : super(key: key);
  final _walletController = Get.put(WalletController());
  @override
  Widget build(BuildContext context) {
    _walletController.fetchCashOutAllTransaction();
    return Obx(
      () => _walletController.isLoadingCashoutAllTran.value
          ? const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Center(child: ShimmerCardBonus()),
            )
          : _walletController.cashoutAllTransactionList.isEmpty
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
                      debugPrint("Pressed 1");
                      debugPrint(
                          "transaction type:${_walletController.cashoutAllTransactionList[index].transactionType!}");
                      _walletController
                          .onFetchWalletTransactionDetail(
                              _walletController
                                  .cashoutAllTransactionList[index].id!,
                              _walletController
                                  .cashoutAllTransactionList[index].model!)
                          .then(
                            (value) =>
                                WalletTran.transactionDetail(context, value),
                          );
                    },
                    transactionModel:
                        _walletController.cashoutAllTransactionList[index],
                  ),
                  itemCount: _walletController.cashoutAllTransactionList.length,
                  separatorBuilder: (_, __) => const SizedBox.shrink(),
                ),
    );
  }
}
