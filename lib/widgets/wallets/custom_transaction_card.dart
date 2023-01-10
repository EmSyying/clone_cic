import 'package:cicgreenloan/modules/wallet/screen/wallet_transaction_popup_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Utils/helper/color.dart';
import '../../modules/wallet/model/transaction/wallet_transaction_detail.dart';

class WalletTransactionCard extends StatelessWidget {
  final WalletTransactionDetail transactionModel;
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
        height: 70.0,
        margin: const EdgeInsets.only(top: 10, right: 5),
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
                WalletTran.getIcon(transactionModel.transactionType!),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        transactionModel.time ?? '',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(_getStatus(),
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: transactionModel.transactionType ==
                                                  'subscription' &&
                                              transactionModel.status ==
                                                  'partially paid' ||
                                          transactionModel.status == 'pending'
                                      ? AppColor.statusColor['pending']
                                      : transactionModel.transactionType ==
                                                  'subscription' &&
                                              transactionModel.status ==
                                                  'waiting list'
                                          ? Theme.of(context).primaryColor
                                          : transactionModel.transactionType ==
                                                          'subscription' &&
                                                      transactionModel
                                                              .status ==
                                                          'paid' ||
                                                  transactionModel
                                                          .transactionType ==
                                                      'bonus' ||
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
                    ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: _getStatus().isNotEmpty ? 0 : 15),
                    child: _amount(),
                  ),
                  if (transactionModel.transactionType == 'exchange')
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        '100 pts',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.w700),
                      ),
                    )
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

  Color _getBgColor() => transactionModel.transactionType!.toLowerCase() ==
              'bonus' ||
          transactionModel.transactionType!.toLowerCase() == 'deposit' ||
          transactionModel.transactionType!.toLowerCase() == 'wallet-deposit' ||
          transactionModel.transactionType!.toLowerCase() == 'receive'
      ? AppColor.statusColor['green']!.withOpacity(0.2)
      : AppColor.statusColor['late']!.withOpacity(0.2);

  Widget _amount() {
    bool isMinus = transactionModel.transactionType == 'transfer';

    return Builder(
      builder: (context) => Text(
        '${isMinus ? "-" : ''} ${transactionModel.amount}',
        style: Theme.of(context).textTheme.headline5!.copyWith(
            color: transactionModel.transactionType!.toLowerCase() == 'bonus' ||
                    transactionModel.transactionType!.toLowerCase() ==
                        'deposit' ||
                    transactionModel.transactionType!.toLowerCase() ==
                        'wallet-deposit' ||
                    transactionModel.transactionType!.toLowerCase() == 'receive'
                ? AppColor.statusColor['green']
                : AppColor.statusColor['late'],
            fontWeight: FontWeight.bold),
      ),
    );
  }

  // Color _amountColor ()=> transactionModel.transactionType == 'cash in'?;
}
