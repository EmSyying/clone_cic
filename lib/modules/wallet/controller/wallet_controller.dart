import 'package:cicgreenloan/Utils/function/convert_to_double.dart';
import 'package:cicgreenloan/modules/wallet/model/deposit/deposit_detail.dart';
import 'package:cicgreenloan/modules/wallet/model/mma_deposit_card_model.dart';
import 'package:cicgreenloan/modules/wallet/model/wallet/wallet_data_model.dart';
import 'package:cicgreenloan/utils/helper/api_base_helper.dart';
import 'package:cicgreenloan/utils/helper/custom_route_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/custom_success_screen.dart';
import '../../qr_code/qrcode_controller/qr_type.dart';
import '../model/invest/card_mma_invest_model.dart';
import '../model/transfer_recieved/transfer_model.dart';

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
  List<MMACardInvestModel> mmainvestFIFCard = [
    MMACardInvestModel(title: 'Avg. Annual Return 14.4% to 18%'),
    MMACardInvestModel(title: 'Minimum Period 2 months'),
    MMACardInvestModel(title: 'Monthly Interest'),
    MMACardInvestModel(title: 'Minimum Amount 10,000.00 USD'),
  ].obs;
  List<MMACardInvestModel> mmainvestEquityCard = [
    MMACardInvestModel(title: 'Avg. Annual Return 40% to 51%'),
    MMACardInvestModel(title: 'Minimum Period 2 months'),
    MMACardInvestModel(title: 'Capital Gain & Dividend'),
    MMACardInvestModel(title: 'Minimum Amount 1,037.00 USD'),
  ].obs;
// Fetch on Deposit Detail
  final depositDetail = DepositDetail().obs;
  final isDepositDetail = false.obs;
  Future<DepositDetail> onFetchDepositDetail(int id) async {
    isDepositDetail(true);
    await _apiBaseHelper
        .onNetworkRequesting(
            url: 'user/wallet/deposit/$id',
            methode: METHODE.get,
            isAuthorize: true)
        .then((response) {
      depositDetail.value = DepositDetail.fromJson(response['data']);

      isDepositDetail(false);
    }).onError((ErrorModel error, stackTrace) {
      isDepositDetail(false);
      debugPrint('Error : ${error.statusCode} : ${error.bodyString}');
    });
    return depositDetail.value;
  }

  ///Fetch Wallet Amount
  final walletAmount = WalletDataModel().obs;
  final fetchWalletLoading = false.obs;
  Future<WalletDataModel> fetchWalletAmount() async {
    fetchWalletLoading(true);
    await _apiBaseHelper
        .onNetworkRequesting(
            url: 'user/wallet', methode: METHODE.get, isAuthorize: true)
        .then((response) {
      var wallet = response['data'];
      walletAmount.value = WalletDataModel.fromJson(wallet);
      transferModel.value = transferModel.value.copyWith(
        phoneNumber: walletAmount.value.wallet!.accountNumber,
        idQR: walletAmount.value.invester!.investerId,
        userName: walletAmount.value.invester!.investerName,
      );
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
    depositAmount.value = '';
  }

  final depositAmount = ''.obs;
  final isToDeposit = false.obs;
  Future<void> onToDepositBankOrWallet(BuildContext context) async {
    debugPrint("wallet is working");
    isToDeposit(true);
    await _apiBaseHelper.onNetworkRequesting(
      url: 'user/wallet/deposit',
      methode: METHODE.post,
      isAuthorize: true,
      body: {
        'amount': onConvertToDouble(depositAmount.value),
      },
    ).then((response) {
      // customRouterSnackbar(
      //     title: 'Done',
      //     description: '${response['message']}',
      //     type: SnackType.done);
      //  navigator here
      Future.delayed(
        const Duration(seconds: 1),
        () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CustomSucessScreen(
                  title: 'Success',
                  description: 'The Deposit is Submit successfully.',
                  buttonTitle: 'Done',
                  onPressedButton: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          );
        },
      );

      // Future.delayed(const Duration(seconds: 2), () {
      //   // context.go("/wallet");
      //   Navigator.pop(context);
      //   Navigator.pop(context);
      //   Navigator.pop(context);
      // });
      depositAmount.value = '';
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
        'sender': walletAmount.value.wallet!.accountNumber,
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
  void clearDeposit() {
    recievingAmount('');
    amountController.text = '';
  }

  final recievingAmount = ''.obs;
  TextEditingController amountController = TextEditingController();
  // final frm = NumberFormat("#,###", "en");
  void onchageKeyboard(dynamic value) {
    if (value.isNotEmpty) {
      depositAmount.value = value;
    } else {
      depositAmount.value = '';
    }
    update();
  }

  ///MMA Transfer
  final transferModel = TransferModel(qrType: CiCQr.wallet.key).obs;
  TextEditingController qrRecievingPhone = TextEditingController();
  TextEditingController qrRecievingAmount = TextEditingController();
  final remarkText = ''.obs;

  void onScanTransfer(String result) {
    try {
      var decodedResult = TransferModel.fromJson(result);
      qrRecievingPhone.text = decodedResult.phoneNumber ?? '';
      qrRecievingAmount.text = decodedResult.amount ?? '';
    } catch (e) {
      debugPrint('Error $e');
    }
  }

  void clearMMATransfer() {
    qrRecievingPhone.text = '';
    qrRecievingAmount.text = '';
    remarkText('');
  }
}
