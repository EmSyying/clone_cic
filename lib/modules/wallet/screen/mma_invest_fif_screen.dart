import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../widgets/wallets/custom_card_invest_fif.dart';
import '../../../widgets/wallets/custom_title_cart_ivest_fif.dart';
import '../../investment_module/screen/cic_equity_fund.dart';
import '../../investment_module/screen/cic_fixed_income.dart';
import '../controller/wallet_controller.dart';

class MMAInvestFIFScreen extends StatelessWidget {
  const MMAInvestFIFScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contWallet = Get.put(WalletController());
    // final guidkey = Get.put(CiCGuidController());
    // final priceController = Get.put(PriceController());
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
                children: contWallet.mmainvestFIFCard
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
                debugPrint('test fif======');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CiCFixedIncome(
                      ismmaInvestFIF: true,
                    ),
                  ),
                );
              },
            ),
            CustomCardInvestFIF(
              assetImage: 'assets/images/wallet/mma_invest_equity.jpg',
              titleFIF: 'CiC EQUITY FUND',
              column: Column(
                children: contWallet.mmainvestEquityCard
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CiCEquityFund(
                      isEquityTrue: true,
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
