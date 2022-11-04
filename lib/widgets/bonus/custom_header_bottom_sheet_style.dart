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
      this.isAmountFormat = false})
      : super(key: key);
  final String? type;
  final String? label;
  final String? time;
  final num? amount;
  final String? amountFormat;
  final bool? isAmountFormat;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: type == 'bonus' ||
                      type == 'cash-in' ||
                      type == 'wallet-deposit' ||
                      type == 'deposit'
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
                Text(
                  label ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        time ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: action ??
                          Text(
                            isAmountFormat == true
                                ? amountFormat!
                                : "${FormatToK.digitNumber(amount ?? 0)} USD",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: type == 'bonus' ||
                                            type == 'cash-in' ||
                                            type == 'wallet-deposit' ||
                                            type == 'deposit'
                                        ? AppColor.statusColor['green']
                                        : type == 'subscription'
                                            ? Colors.black
                                            : AppColor.statusColor['late'],
                                    fontWeight: FontWeight.bold),
                          ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
