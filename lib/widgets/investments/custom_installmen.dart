import 'package:flutter/material.dart';

import '../../utils/function/format_to_k.dart';

class CustomInstallment extends StatelessWidget {
  const CustomInstallment(
      {Key? key, this.amount, this.dateOfInstall, this.title})
      : super(key: key);
  final String? dateOfInstall;
  final num? amount;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Date of Installment',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontSize: 14),
              ),
              Text(
                '$dateOfInstall',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 12),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Amount',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontSize: 14),
              ),
              Text(
                "${FormatToK.digitNumber(num.parse(amount.toString()))} USD",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 12, color: Colors.red),
              )
            ],
          ),
        ],
      ),
    );
  }
}
