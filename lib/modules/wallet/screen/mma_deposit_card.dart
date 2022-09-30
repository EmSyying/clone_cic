import 'package:cicgreenloan/modules/wallet/controller/wallet_controller.dart';
import 'package:cicgreenloan/modules/wallet/screen/deposit_to_screen.dart';
import 'package:cicgreenloan/widgets/custom_showbottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/underdevelopment_bottom_sheet.dart';
import '../../../widgets/mmaccount/custom_mma_card.dart';
import 'deposit_from_screen.dart';

class MMADepositCard extends StatelessWidget {
  const MMADepositCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contWallet = Get.put(WalletController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
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
            Column(
              children: contWallet.mmacardlist
                  .map(
                    (e) => CustomMMACard(
                      onTap: () async {
                        if (e.title ==
                            contWallet.mmacardlist.elementAt(1).title) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DepositFromScreen(),
                            ),
                          );
                        } else if (e.title ==
                            contWallet.mmacardlist.elementAt(0).title) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DepositToScreen(),
                            ),
                          );
                        } else {
                          onShowBottomSheet(
                            isHeight: MediaQuery.of(context).size.height * .4,
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