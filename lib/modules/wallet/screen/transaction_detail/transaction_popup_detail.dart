import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/form_builder/custom_button.dart';
import '../../../../widgets/wallets/custom_wallet_label_detail.dart';
import '../../controller/wallet_controller.dart';
import '../../model/transaction/wallet_transaction_detail.dart';

class TransactionPopUpDetail extends StatelessWidget {
  final WalletTransactionDetail? model;
  const TransactionPopUpDetail({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());
    return Obx(
      () => walletController.transactionDetailLoading.value
          ? const SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
              child: Column(
                children: [
                  CustomWalletDetail(
                      label: 'Transaction ID',
                      value: model!.transactionId ?? ""),
                  CustomWalletDetail(
                      label: 'Payment Method',
                      value: model!.depositMethod ?? ""),
                  CustomWalletDetail(label: 'Date', value: model!.date),
                  CustomWalletDetail(
                      label: 'Remark', value: model!.remark ?? ""),
                  const SizedBox(height: 25.0),
                  CustomButton(
                    isDisable: false,
                    isOutline: true,
                    title: 'Close',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
    );
  }
}
