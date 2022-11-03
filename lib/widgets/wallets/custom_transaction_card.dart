import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Utils/helper/color.dart';
import '../../modules/wallet/model/transaction/wallet_transaction.dart';

class WalletTransactionCard extends StatelessWidget {
  final WalletTransaction transactionModel;
  final GestureTapCallback? ontap;
  final Color? color;
  const WalletTransactionCard({
    Key? key,
    required this.transactionModel,
    this.ontap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
        width: double.infinity,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(30),
            blurRadius: 6,
            offset: const Offset(0, 1),
          )
        ], borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Icon with accent bg Color
            Container(
              margin: const EdgeInsets.only(left: 10),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _getBgColor(),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                _getIcon(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      transactionModel.label ?? '',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Text(
                      transactionModel.time ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 12, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (_getStatus().isNotEmpty)
                    Text(_getStatus(),
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            color:
                                transactionModel.transactionType ==
                                                'subscription' &&
                                            transactionModel
                                                    .status ==
                                                'partially paid' ||
                                        transactionModel.status == 'pending'
                                    ? AppColor.statusColor['pending']
                                    : transactionModel
                                                    .transactionType ==
                                                'subscription' &&
                                            transactionModel
                                                    .status ==
                                                'waiting list'
                                        ? AppColor.mainColor
                                        : transactionModel
                                                            .transactionType ==
                                                        'subscription' &&
                                                    transactionModel
                                                            .status ==
                                                        'paid' ||
                                                transactionModel
                                                        .transactionType ==
                                                    'cash-in' ||
                                                transactionModel
                                                            .transactionType ==
                                                        'cash-out' &&
                                                    transactionModel.status ==
                                                        'paid' ||
                                                transactionModel.status ==
                                                    'confirmed'
                                            ? AppColor.statusColor['green']
                                            : AppColor.statusColor['late'])),
                  _amount(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getStatus() =>
      transactionModel.status != null && transactionModel.status != 'approved'
          ? transactionModel.status!.capitalize!
          : '';

  String _getIcon() {
    switch (transactionModel.transactionType) {
      case 'bonus':
      case 'deposit':
        return 'assets/images/svgfile/dividend.svg';
      case 'cash out':
        return 'assets/images/svgfile/cashout1.svg';
      default:
        return 'assets/images/svgfile/subscribe_card.svg';
    }
  }

  Color _getBgColor() => transactionModel.transactionType == 'bonus' ||
          transactionModel.transactionType == 'deposit'
      ? AppColor.statusColor['green']!.withOpacity(0.2)
      : AppColor.statusColor['late']!.withOpacity(0.2);

  Widget _amount() {
    bool isMinus = transactionModel.transactionType == 'transfer';

    return Builder(
      builder: (context) => Text(
        '${isMinus ? "-" : ''} ${transactionModel.amount}',
        style: Theme.of(context).textTheme.headline5!.copyWith(
            color: transactionModel.transactionType == 'deposit' ||
                    transactionModel.transactionType == 'cashin'
                ? AppColor.statusColor['green']
                : AppColor.statusColor['late'],
            fontWeight: FontWeight.bold),
      ),
    );
  }

  // Color _amountColor ()=> transactionModel.transactionType == 'cash in'?;
}
