import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../modules/bonus/controllers/bonus_controller.dart';
import '../../modules/wallet/screen/wallet_transaction_popup_detail.dart';
import '../../utils/helper/color.dart';

class CustomHeaderBottomStyle extends StatelessWidget {
  const CustomHeaderBottomStyle(
      {Key? key,
      this.type,
      this.label,
      this.time,
      this.amount,
      this.action,
      this.amountFormat,
      this.isAmountFormat = false,
      this.pointAmount})
      : super(key: key);
  final String? type;
  final String? label;
  final String? time;
  final num? amount;
  final String? pointAmount;
  final String? amountFormat;
  final bool? isAmountFormat;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, bottom: 8.0),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: type!.toLowerCase() == 'bonus' ||
                      type!.toLowerCase() == 'cash-in' ||
                      type!.toLowerCase() == 'wallet-deposit' ||
                      type!.toLowerCase() == 'deposit' ||
                      type!.toLowerCase() == 'receive'
                  ? AppColor.statusColor['green']!.withOpacity(0.2)
                  : AppColor.statusColor['late']!.withOpacity(0.2)),
          child: Center(
            child: SvgPicture.asset(
              WalletTran.getIcon(type!),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        label ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 2),
                      child: action ??
                          Text(
                            isAmountFormat == true
                                ? amountFormat!
                                : "${FormatToK.digitNumber(amount ?? 0)} USD",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: type!.toLowerCase() == 'bonus' ||
                                            type!.toLowerCase() == 'cash-in' ||
                                            type!.toLowerCase() ==
                                                'wallet-deposit' ||
                                            type!.toLowerCase() == 'deposit' ||
                                            type!.toLowerCase() == 'receive'
                                        ? AppColor.statusColor['green']
                                        : type == 'subscription'
                                            ? Colors.black
                                            : AppColor.statusColor['late'],
                                    fontWeight: FontWeight.bold),
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: Text(
                        time ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    const Spacer(),
                    if (type!.toLowerCase() == 'exchange')
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text(
                                pointAmount ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
