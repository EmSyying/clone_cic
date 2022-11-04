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
      context: context,
      child: TransactionPopUpDetail(
        model: model,
      ),
    );
  }

  static String getIcon(String type) {
    switch (type) {
      case 'bonus':
      case 'deposit':
      case 'wallet-deposit':
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
//   static Widget _type(String type) {
//     switch (type) {
//       case 'cash-out':
//         return const CashOutDetail();
//       default:
//         return const CustomSubscriptionDetail(
//           isCashin: false,
//           type: 'cash out',
//           paymentStatus: 'w',
//           paymentType: 'ABA',
//           amount: 1200,
//           bankName: 'ABA',
//           transactionDate: '05 May 2002',
//         );
//     }
//   }
// }





// class _TransactionBottomSheetState extends State<TransactionBottomSheet> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           margin: const EdgeInsets.only(top: 10),
//           width: 45,
//           height: 4,
//           decoration: BoxDecoration(
//             color: Colors.grey[400],
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         const SafeArea(
//           top: false,
//           minimum: EdgeInsets.symmetric(vertical: 20),
//           child: CustomSubscriptionDetail(
//             isCashin: true,
//             type: 'cash out',
//             paymentStatus: 'w',
//             paymentType: 'ABA',
//             amount: 1200,
//             bankName: 'ABA',
//             transactionDate: '05',
//           ),
//         )
//       ],
//     );
//   }
// }
