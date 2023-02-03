import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/helper/color.dart';

class BankingInforCard extends StatelessWidget {
  final String? bankName;
  final bool? isConfirm;
  final String? accountName;
  final String? accountNumber;
  final GestureTapCallback? onChangeBank;
  final GestureTapCallback? onConfirmBank;
  const BankingInforCard(
      {Key? key,
      this.accountName,
      this.bankName,
      this.accountNumber,
      this.onChangeBank,
      this.onConfirmBank,
      this.isConfirm = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Confirm your banking information',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SvgPicture.asset('assets/images/svgfile/questicon.svg')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bank Name :',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  bankName!,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Account Name :',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  accountName!,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Account Number :',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  accountNumber!,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onChangeBank,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 10),
              child: const Center(
                child: Text('Change Account'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: onConfirmBank,
              child: Row(
                children: [
                  Icon(
                    isConfirm == true
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    color: Theme.of(context).primaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Confirm Account',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
