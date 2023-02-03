import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';
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
    final settingCon = Get.put(SettingController());
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
                        .headlineSmall!
                        .copyWith(fontSize: 11),
                  ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: e.transaction!
                        .asMap()
                        .entries
                        .map(
                          (data) => Obx(
                            () => WalletTransactionCard(
                              transactionModel: data.value,
                              ontap: walletController
                                      .transactionDetailLoading.value
                                  ? null
                                  : () async {
                                      debugPrint("is pressed wallet");

                                      await walletController
                                          .onFetchWalletTransactionDetail(
                                              data.value.id!,
                                              data.value.model!);
                                      // ignore: use_build_context_synchronously
                                      WalletTran.transactionDetail(
                                          context,
                                          walletController
                                              .walletTransactionDetail.value);
                                      // settingCon.isHideBottomNavigation.value =
                                      //     true;
                                      // settingCon.update();
                                    },
                            ),
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
