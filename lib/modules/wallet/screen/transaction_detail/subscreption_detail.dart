import 'package:cicgreenloan/modules/wallet/controller/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/function/format_to_k.dart';
import '../../../../Utils/helper/color.dart';
import '../../model/transaction/wallet_transaction_detail.dart';

class CashOutDetail extends StatelessWidget {
  final WalletTransactionDetail? model;
  const CashOutDetail({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final walletController = Get.put(WalletController());
    return Obx(
      () => walletController.transactionDetailLoading.value
          ? const SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _textStatus(
                      title: 'Subscription Status',
                      value: model!.status?.toUpperCase()),
                  _textStatus(
                      title: 'Investor ID', value: model!.transactionType),
                  _textStatus(title: 'Bank Name:', value: model!.bankName),
                  _textStatus(title: 'Transaction Date:', value: model!.date),
                  _textStatus(
                      title: 'to account:', value: model!.bankAccountNumber),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Subscription Cost:',
                                style: textStyle.headlineSmall!
                                    .copyWith(fontSize: 14)),
                            Text('${FormatToK.digitNumber(1200)} USD',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        fontSize: 14,
                                        color: 1222 == 0
                                            ? AppColor.statusColor['late']
                                            : Theme.of(context).primaryColor)),
                          ],
                        ),
                        const SizedBox(height: 15),
                        // if (122 != 0)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Paid Amount:',
                              style: textStyle.headlineSmall!
                                  .copyWith(fontSize: 14),
                            ),
                            if (12 != 0)
                              Text('${FormatToK.digitNumber(1200)} USD',
                                  style: textStyle.displayMedium!.copyWith(
                                      fontSize: 14,
                                      color: Theme.of(context).primaryColor)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Divider(
                          thickness: 0.4,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Amount to pay:',
                              style: textStyle.displayMedium!.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${FormatToK.digitNumber(1200)} USD',
                              style: textStyle.displayMedium!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _textStatus({String? title, String? value}) {
    return Builder(builder: (_) {
      final textStyle = Theme.of(_).textTheme;
      return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Text(
              title ?? '',
              style: textStyle.displayMedium!
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
            )),
            Expanded(
              child: Text(
                value ?? '',
                style: textStyle.displayMedium!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      );
    });
  }
}
