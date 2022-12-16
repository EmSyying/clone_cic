import 'package:cicgreenloan/modules/wallet/model/transaction/wallet_transaction.dart';
import 'package:cicgreenloan/widgets/wallets/custom_transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/wallet/controller/wallet_controller.dart';
import '../../modules/wallet/screen/wallet_transaction_popup_detail.dart';

class CustomWalletTransaction extends StatelessWidget {
  const CustomWalletTransaction({Key? key, this.walletTransaction})
      : super(key: key);
  final List<WalletTransaction>? walletTransaction;

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());
    return Column(
      children: walletTransaction!
          .map(
            (e) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Text(
                    e.date!,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontSize: 11),
                  ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: e.transaction!
                        .asMap()
                        .entries
                        .map(
                          (data) => WalletTransactionCard(
                            transactionModel: data.value,
                            ontap: () {
                              walletController
                                  .onFetchWalletTransactionDetail(
                                      data.value.id!, data.value.model!)
                                  .then(
                                    (value) => WalletTran.transactionDetail(
                                        context, value),
                                  );
                            },
                          ),
                        )
                        .toList())
              ],
            ),
          )
          .toList(),
    );
  }
}
