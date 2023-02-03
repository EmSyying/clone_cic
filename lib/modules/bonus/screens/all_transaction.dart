import 'package:cicgreenloan/widgets/bonus/custom_empty_state.dart';
import 'package:cicgreenloan/widgets/wallets/custom_wallet_transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/bonus/custom_shimmer_card_bonus.dart';
import '../../../widgets/bonus/transaction_card.dart';
import '../../wallet/controller/wallet_controller.dart';
import '../controllers/bonus_controller.dart';

class AllTransaction extends StatefulWidget {
  final bool? isStatus;
  const AllTransaction({Key? key, this.status, this.isStatus = false})
      : super(key: key);

  final String? status;
  @override
  State<AllTransaction> createState() => _AllTransactionState();
}

class _AllTransactionState extends State<AllTransaction> {
  final _walletController = Get.put(WalletController());
  final _bonusCon = Get.put(BonusController());

  @override
  void initState() {
    // Pending Subscribtion
    _bonusCon.fetchPendingTransaction();
    //get all type
    _walletController.getAllTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _walletController.loadingTransaction.value
          ? const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Center(child: ShimmerCardBonus()),
            )
          : _bonusCon.pendingtransactionList.isEmpty &&
                  _walletController.allTransaction.isEmpty
              ? const SingleChildScrollView(
                  child: CustomEmptyState(),
                )
              : Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _bonusCon.pendingtransactionList.isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (_bonusCon
                                      .pendingtransactionList.isNotEmpty)
                                    CustomTransactionCard(
                                      hisStoryList:
                                          _bonusCon.pendingtransactionList,
                                      title: "Pending Transactions",
                                      isTitle: true,
                                      isStatus: true,
                                      isPendingtransaction: true,
                                    )
                                ],
                              )
                            : const SizedBox.shrink(),
                        _walletController.allTransaction.isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 20),
                                    child: Text(
                                      'Transactions',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: CustomWalletTransaction(
                                      walletTransaction:
                                          _walletController.allTransaction,
                                    ),
                                  )
                                ],
                              )
                            : const CustomEmptyState(),
                        const SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ),
    );
  }
}
