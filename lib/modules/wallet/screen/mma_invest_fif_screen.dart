import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../Utils/helper/injection_helper/injection_helper.dart';
import '../../../widgets/wallets/custom_card_invest_fif.dart';
import '../../../widgets/wallets/custom_title_cart_ivest_fif.dart';

class MMAInvestFIFScreen extends StatelessWidget {
  const MMAInvestFIFScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        isLeading: true,
        context: context,
        title: "Invest FIF",
      ),
      body: Obx(
        () => Column(
          children: [
            CustomCardInvestFIF(
              assetImage: 'assets/images/wallet/mma_invest_fif.jpg',
              titleFIF: 'CiC FIXED INCOME FUND',
              column: Column(
                children: InjectionHelper.walletController.mmainvestFIFCard
                    .map(
                      (e) => CustomTitleCardInvestFIF(
                        title: e.title,
                      ),
                    )
                    .toList(),
              ),
              titleButton: 'Explore More',
              onPressed: () {},
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const CiCFixedIncome(
                //       ismmaInvestFIF: true,
                //     ),
                //   ),
                // );
                InjectionHelper.investmentController.isFromWallet.value = true;
                context.push("/wallet/invest-fif/cic-fixed-income");
              },
            ),
            CustomCardInvestFIF(
              assetImage: 'assets/images/wallet/mma_invest_equity.jpg',
              titleFIF: 'CiC EQUITY FUND',
              column: Column(
                children: InjectionHelper.walletController.mmainvestEquityCard
                    .map(
                      (e) => CustomTitleCardInvestFIF(
                        title: e.title,
                      ),
                    )
                    .toList(),
              ),
              titleButton: 'Explore More',
              onPressed: () {},
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const CiCEquityFund(
                //       isEquityTrue: true,
                //     ),
                //   ),
                // );
                context.push("/wallet/invest-fif/cic-equity-fund");
              },
            )
          ],
        ),
      ),
    );
  }
}
