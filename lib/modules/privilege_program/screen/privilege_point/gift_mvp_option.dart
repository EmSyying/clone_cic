import 'dart:io';

import 'package:cicgreenloan/Utils/helper/custom_appbar_colorswhite.dart';
import 'package:cicgreenloan/modules/wallet/controller/wallet_controller.dart';
import 'package:cicgreenloan/widgets/wallets/custom_mma_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class GiftMvpOption extends StatelessWidget {
  const GiftMvpOption({super.key});

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());
    return Scaffold(
      appBar: CustomAppBarWhiteColor(
        context: context,
        elevation: 0,
        title: 'Gift MVP',
        colorTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Platform.isIOS
              ? const Icon(Icons.arrow_back_ios)
              : const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: walletController.mvpgiftOption.length,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: CustomMMACard(
            title: walletController.mvpgiftOption[index].title,
            imageMMAcard: walletController.mvpgiftOption[index].imageMMACard,
            onTap: () {
              try {
                final location = GoRouterState.of(context).location;

                if (index == 0) {
                  debugPrint('-------->>>>$location');
                  context.push("$location/gift-mvp-template");
                }
                if (index == 1) {
                  context.push("$location/gift-mvp-transfer");
                }
              } catch (e) {
                debugPrint("Routing Error => $e");
              }
            },
          ),
        ),
      ),
    );
  }
}
