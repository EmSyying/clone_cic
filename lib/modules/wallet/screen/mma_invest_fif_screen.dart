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
    InjectionHelper.walletController.fetchFiFOptionList();
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        isLeading: true,
        context: context,
        title: "Invest FIF",
      ),
      body:
          Obx(() => InjectionHelper.walletController.listFiFOptionLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: InjectionHelper.walletController.listFiFOption
                      .asMap()
                      .entries
                      .map((e) {
                    return CustomCardInvestFIF(
                      assetImage: e.value.background,
                      titleFIF: e.value.title,
                      onTap: () {
                        e.key == 0
                            ? context
                                .push("/wallet/invest-fif/cic-fixed-income")
                            : context
                                .push("/wallet/invest-fif/cic-equity-fund");
                      },
                      column: Column(
                        children: e.value.details!.asMap().entries.map((e) {
                          return CustomTitleCardInvestFIF(title: e.value.list);
                        }).toList(),
                      ),
                      exploreMore: 'Explore More',
                      onTapExplore: () {},
                    );
                  }).toList(),
                )),
    );
  }
}
