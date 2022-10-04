import 'package:cicgreenloan/Utils/function/convert_to_double.dart';
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
      imageMMACard: 'assets/images/wallet/fontisto_wallet.svg',
    ),
    MMADepositCardModel(
      title: 'To receive from other MM Account',
      imageMMACard: 'assets/images/wallet/navigation_icons.svg',
    ),
  ].obs;
  List<MMADepositCardModel> mmAccountTransferList = [
    MMADepositCardModel(
      title: 'Cash Out',
      imageMMACard: 'assets/images/svgfile/cashout.svg',
    ),
    MMADepositCardModel(
      title: 'Transfer to other MM Account',
      imageMMACard: 'assets/images/wallet/transferto-other-account.svg',
    ),
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

  // To Deposit Via Bank/Wallet
  void clearDepositAmount() {
    controllerToDepositAmount.text = '';
  }

  TextEditingController controllerToDepositAmount = TextEditingController();
  final isToDeposit = false.obs;
  Future<void> onToDepositBankOrWallet(BuildContext context) async {
    debugPrint("wallet is working");
    isToDeposit(true);
    await _apiBaseHelper.onNetworkRequesting(
      url: 'user/wallet/deposit',
      methode: METHODE.post,
      isAuthorize: true,
      body: {
        'amount': onConvertToDouble(controllerToDepositAmount.text),
      },
    ).then((response) {
      customRouterSnackbar(
          title: 'Done',
          description: '${response['message']}',
          type: SnackType.done);
      //  navigator here

      Future.delayed(const Duration(seconds: 2), () {
        // context.go("/wallet");
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context);
      });
      controllerToDepositAmount.text = '';
      isToDeposit(false);
    }).onError((ErrorModel error, stackTrace) {
      debugPrint("Message Error:${error.bodyString}");
      isToDeposit(false);
      customRouterSnackbar(
          title: 'Failed',
          description: '${error.bodyString['message']}',
          type: SnackType.error);
    });
  }

  ///transaction by Qr Code
  Future<void> oscanWalletQr(String amount, String receiver) async {
    await _apiBaseHelper.onNetworkRequesting(
      url: 'user/wallet',
      methode: METHODE.post,
      isAuthorize: true,
      body: {
        'sender': walletAmount.value.accountNumber,
        'receiver': '296566817',
        'amount': amount,
      },
    ).then((response) {
      customRouterSnackbar(
          title: 'Done', description: 'Success', type: SnackType.done);
    }).onError((ErrorModel error, stackTrace) {
      customRouterSnackbar(
          title: 'Done', description: 'Success', type: SnackType.error);
    });
  }

  ///Set Amount
  final recievingAmount = ''.obs;
  TextEditingController amountController = TextEditingController();
}
