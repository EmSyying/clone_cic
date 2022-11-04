import 'package:cicgreenloan/modules/wallet/screen/wallet_transaction_popup_detail.dart';
import 'package:cicgreenloan/widgets/bonus/custom_empty_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/bonus/custom_shimmer_card_bonus.dart';
import '../../../widgets/wallets/custom_transaction_card.dart';
import '../../wallet/controller/wallet_controller.dart';

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

  @override
  void initState() {
    _walletController.getAllTransaction(); //get all type
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _walletController.loadingTransaction.value
          ? const Center(child: ShimmerCardBonus())
          : 1 == 2
              ? const SingleChildScrollView(
                  child: CustomEmptyState(),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _walletController.pendingTransaction.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 20),
                                  child: Text(
                                    'Pending Transactions',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(fontSize: 14),
                                  ),
                                ),
                                ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  shrinkWrap: true,
                                  itemBuilder: (_, index) =>
                                      WalletTransactionCard(
                                    ontap: () {
                                      debugPrint(
                                          "Type:${_walletController.pendingTransaction[index].transactionType!}");
                                      _walletController
                                          .onFetchWalletTransactionDetail(
                                              _walletController
                                                  .pendingTransaction[index]
                                                  .id!,
                                              _walletController
                                                  .pendingTransaction[index]
                                                  .transactionType!);
                                      WalletTran.transactionDetail(
                                          context,
                                          _walletController
                                              .pendingTransaction[index]);
                                    },
                                    transactionModel: _walletController
                                        .pendingTransaction[index],
                                  ),
                                  itemCount: _walletController
                                      .pendingTransaction.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox.shrink(),
                                ),
                              ],
                            )
                          // CustomTransactionCard(
                          //     hisStoryList: const [],
                          //     isStatus: widget.isStatus,
                          //     title: "Transactions",
                          //     isTitle: true,
                          //   )
                          : const SizedBox.shrink(),
                      _walletController.allTransaction.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 20),
                                  child: Text(
                                    'Transactions',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(fontSize: 14),
                                  ),
                                ),
                                ListView.separated(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (_, index) =>
                                      WalletTransactionCard(
                                    transactionModel:
                                        _walletController.allTransaction[index],
                                    ontap: () {
                                      debugPrint(
                                          "Type1:${_walletController.allTransaction[index].transactionType!}id:${_walletController.allTransaction[index].id!}");
                                      _walletController
                                          .onFetchWalletTransactionDetail(
                                              _walletController
                                                  .allTransaction[index].id!,
                                              _walletController
                                                  .allTransaction[index]
                                                  .transactionType!)
                                          .then(
                                            (value) =>
                                                WalletTran.transactionDetail(
                                                    context, value),
                                          );
                                    },
                                  ),
                                  itemCount:
                                      _walletController.allTransaction.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox.shrink(),
                                ),
                              ],
                            )
                          // CustomTransactionCard(
                          //     hisStoryList: const [],
                          //     // isStatus: widget.isStatus,
                          //     title: "Pending Transactions",
                          //     isTitle: true,
                          //     isStatus: true, isPendingtransaction: true,
                          //   )
                          : const SizedBox.shrink(),
                      const SizedBox(height: 30.0),
                    ],
                  ),
                ),
    );
  }
}
