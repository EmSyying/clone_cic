import 'package:cicgreenloan/modules/wallet/model/mma_deposit_card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
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

  ///Set Amount

  final recievingAmount = ''.obs;
  TextEditingController amountController = TextEditingController();
}
