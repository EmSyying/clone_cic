import 'package:cicgreenloan/modules/wallet/screen/transaction_detail/cash_out_detail.dart';
import 'package:flutter/material.dart';

import '../model/transaction/wallet_transaction.dart';

class WalletTran {
  static void showDetail(BuildContext context, WalletTransaction model) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 45,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SafeArea(
              top: false,
              minimum: const EdgeInsets.only(bottom: 20),
              child: CashOutDetail(model: model),
            ),
          ],
        ),
      ),
    );
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
