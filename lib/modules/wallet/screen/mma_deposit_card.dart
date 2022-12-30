import 'package:cicgreenloan/modules/wallet/controller/wallet_controller.dart';
import 'package:cicgreenloan/widgets/custom_showbottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../Utils/helper/underdevelopment_bottom_sheet.dart';

import '../../../utils/helper/custom_appbar.dart';
import '../../../widgets/wallets/custom_mma_card.dart';

class MMADepositCard extends StatelessWidget {
  final String fromModule;
  const MMADepositCard({Key? key, required this.fromModule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contWallet = Get.put(WalletController());
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        isLeading: true,
        context: context,
        title: fromModule == "Deposit" ? "Deposit" : "MM Account Transfer",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20.0,
              ),
              child: Text(
                'Please Choose',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            fromModule == "Deposit"
                ? Column(
                    children: contWallet.mmacardlist
                        .map(
                          (e) => CustomMMACard(
                            onTap: () async {
                              if (e.title ==
                                  contWallet.mmacardlist.elementAt(1).title) {
                                // context.push(
                                //     '/wallet/deposit-card/reciever-mm-account');
                                onShowBottomSheet(
                                  isHeight:
                                      MediaQuery.of(context).size.height * .4,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  isNoAppBar: true,
                                  child: const CustomPopupButtonSheet(
                                    assetImage:
                                        'assets/images/svgfile/underDevelopment.svg',
                                    description:
                                        'This feature is under development at the moment',
                                    title: 'This feature not available yet',
                                  ),
                                );
                              } else if (e.title ==
                                  contWallet.mmacardlist.elementAt(0).title) {
                                debugPrint("account transfer");
                                context.push(
                                    '/wallet/deposit-card/deposit-to-screen');
                              } else {
                                showModalBottomSheet(
                                  useRootNavigator: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) =>
                                      const CustomPopupButtonSheet(
                                    assetImage:
                                        'assets/images/svgfile/underDevelopment.svg',
                                    description:
                                        'This feature is under development at the moment',
                                    title: 'This feature not available yet',
                                  ),
                                );
                              }
                            },
                            title: e.title,
                            imageMMAcard: e.imageMMACard,
                          ),
                        )
                        .toList(),
                  )
                : Column(
                    children: contWallet.mmAccountTransferList
                        .map(
                          (e) => CustomMMACard(
                            onTap: () async {
                              if (e.title ==
                                  contWallet.mmAccountTransferList
                                      .elementAt(0)
                                      .title) {
                                context.push(
                                    '/wallet/mma-transfer/mma-cash-out/new-cash-oute');
                              } else {
                                // context.push(
                                //     '/wallet/transfer-to-other-mmacount?isFromLink=false');
                                showModalBottomSheet(
                                  useRootNavigator: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) =>
                                      const CustomPopupButtonSheet(
                                    assetImage:
                                        'assets/images/svgfile/underDevelopment.svg',
                                    description:
                                        'This feature is under development at the moment',
                                    title: 'This feature not available yet',
                                  ),
                                );
                              }
                            },
                            title: e.title,
                            imageMMAcard: e.imageMMACard,
                          ),
                        )
                        .toList(),
                  ),
          ],
        ),
      ),
    );
  }
}
