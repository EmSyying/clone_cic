import 'package:cicgreenloan/widgets/custom_showbottomsheet.dart';
import 'package:flutter/material.dart';

import '../model/transaction/wallet_transaction_detail.dart';
import 'transaction_detail/transaction_popup_detail.dart';

class WalletTran {
  static void transactionDetail(
      BuildContext context, WalletTransactionDetail model) {
    onShowBottomSheet(
      label: model.label,
      isAmountFormat: true,
      amountFormat: model.amount,
      type: model.transactionType,
      time: model.time,
      pointAmount: model.pointAmount,
      context: context,
      isDismissible: true,
      child: TransactionPopUpDetail(
        model: model,
      ),
    );
  }

  static String getIcon(String type) {
    switch (type) {
      case 'bonus':
        return 'assets/images/svgfile/dividend.svg';
      case 'exchange':
        return 'assets/images/svgfile/exchangepoint.svg';
      case 'redemption':
        return 'assets/images/svgfile/redemption-mvp.svg';
      case 'deposit':
      case 'DEPOSIT':
      case 'wallet-deposit':
      case 'receive':
        return 'assets/images/svgfile/deposit.svg';
      case 'cash out':
      case 'transfer':
        return 'assets/images/svgfile/cashout1.svg';

      case 'fif':
        return 'assets/images/svgfile/fif-transaction.svg';
      default:
        return 'assets/images/svgfile/subscribe_card.svg';
    }
  }
}
