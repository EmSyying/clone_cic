import 'package:cicgreenloan/modules/wallet/model/mma_deposit_card_model.dart';
import 'package:cicgreenloan/utils/helper/api_base_helper.dart';
import 'package:cicgreenloan/utils/helper/custom_route_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/wallet_model.dart';

class WalletController extends GetxController {
  final _apiBaseHelper = ApiBaseHelper();
  final name = ''.obs;

  List<MMADepositCardModel> mmacardlist = [
    MMADepositCardModel(
      title: 'To deposit via Banks / Wallets',
      imageMMACard: 'assets/images/svgfile/dividend.svg',
    ),
    MMADepositCardModel(
      title: 'To receive from other MM Account',
      imageMMACard: 'assets/images/svgfile/cashout1.svg',
    ),
    MMADepositCardModel(
      title: 'To deposit via ZPoin',
      imageMMACard: 'assets/images/svgfile/investfif.svg',
    ),
    MMADepositCardModel(
      title: 'To deposit via KESS PAY',
      imageMMACard: 'assets/images/svgfile/subscribe_card.svg',
    )
  ].obs;

  ///Fetch Wallet Amount
  final walletAmount = WalletAmountModel().obs;
  final fetchWalletLoading = false.obs;
  Future<WalletAmountModel> fetchWalletAmount() async {
    fetchWalletLoading(true);
    await _apiBaseHelper
        .onNetworkRequesting(
            url: 'user/wallet', methode: METHODE.get, isAuthorize: true)
        .then((response) {
      var wallet = response['data']['wallet'];
      walletAmount.value = WalletAmountModel.fromJson(wallet);
      fetchWalletLoading(false);
    }).onError((ErrorModel error, stackTrace) {
      fetchWalletLoading(false);
      debugPrint(
          'FetchWalletAmount Error : ${error.statusCode} : ${error.bodyString}');
    });
    return walletAmount.value;
  }

  ///transaction by Qr Code
  Future<WalletAmountModel> scanWalletQr(String amount) async {
    await _apiBaseHelper.onNetworkRequesting(
      url: 'user/wallet',
      methode: METHODE.post,
      isAuthorize: true,
      body: {
        'sender': '981096049',
        'receiver': '296566817',
        'amount': amount,
      },
    ).then((response) {
      customRouterSnackbar(
          title: 'Done', description: 'Success', type: SnackType.done);
    }).onError((ErrorModel error, stackTrace) {
      customRouterSnackbar(
          title: 'Done', description: 'Success', type: SnackType.done);
    });
    return walletAmount.value;
  }

  ///Set Amount
  final recievingAmount = ''.obs;
  TextEditingController amountController = TextEditingController();
}
