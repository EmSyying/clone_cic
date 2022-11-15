import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

import '../../../Utils/helper/color.dart';
import '../../../modules/bonus/models/history_model.dart';

class CustomSubscriptionDetail extends StatelessWidget {
  final String? subscriptionStatus;
  final String? paymentStatus;
  final String? investID;
  final String? investName;
  final String? type;
  final num? subscriptionUT;
  final num? subscriptiontCost;
  // final num? accumulatedPayment;
  final num? remainingPayment;
  final num? pricePerUT;
  final num? utSubscribe;
  final num? totalSubscription;
  final num? unPaidAmount;
  final String? datePayment;
  final GestureTapCallback? onTab;
  final Histories? histories;
  final bool? isbonus;
  final bool? isCashout;
  final bool? isCashin;
  final bool? isPayment;
  final num? utAmount;
  final String? from;
  final String? toAccount;
  final num? subscriptionID;

  //type cashIn cashOunt and bonus
  final String? paymentType;
  final String? bankName;

  final String? transactionDate;
  final num? amount;
  final num? amountToPay;
  const CustomSubscriptionDetail(
      {Key? key,
      this.histories,
      this.utAmount,
      this.isbonus = false,
      this.isCashout = false,
      this.isCashin = false,
      this.isPayment = false,
      this.subscriptionStatus,
      this.subscriptionUT,
      // this.accumulatedPayment,
      this.subscriptiontCost,
      this.remainingPayment,
      this.paymentStatus,
      this.investID,
      this.investName,
      this.pricePerUT,
      this.utSubscribe,
      this.totalSubscription,
      this.unPaidAmount,
      this.onTab,
      this.datePayment,
      this.paymentType,
      this.bankName,
      this.transactionDate,
      this.amount,
      this.from,
      this.toAccount,
      this.subscriptionID,
      this.type,
      this.amountToPay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      width: double.infinity,
      child: Column(
        children: [
          isbonus == true
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Payment Status:",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                            const SizedBox(height: 20),
                            Text("Payment Type:",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                            const SizedBox(height: 20),
                            Text("UT Amount:",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                            const SizedBox(height: 20),
                            Text("Transaction Date:",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                            const SizedBox(height: 20),
                            // Text("Amount:",
                            //     style: Theme.of(context)
                            //         .textTheme
                            //         .headline2!
                            //         .copyWith(
                            //             fontSize: 14,
                            //             fontWeight: FontWeight.w600)),
                          ],
                        ),
                        const SizedBox(width: 60),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "$paymentStatus",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(fontSize: 14, color: Colors.green),
                            ),
                            const SizedBox(height: 20),
                            Text("$paymentType",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                            const SizedBox(height: 20),
                            Text("$utAmount",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                            const SizedBox(height: 20),
                            Text("$transactionDate",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                            const SizedBox(height: 20),
                            // Text('USD ${FormatToK.digitNumber(amount)}',
                            //     style: Theme.of(context)
                            //         .textTheme
                            //         .headline2!
                            //         .copyWith(
                            //             fontSize: 14, color: Colors.green)),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              : isCashout == true
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Payment Status:",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                const SizedBox(height: 20),
                                Text("Payment Type:",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                const SizedBox(height: 20),
                                Text("Bank Name:",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                const SizedBox(height: 20),
                                Text("Transaction Date:",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                const SizedBox(height: 20),
                                Text("To account:",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                const SizedBox(height: 20),
                                // Text("Amount:",
                                //     style: Theme.of(context)
                                //         .textTheme
                                //         .headline2!
                                //         .copyWith(
                                //             fontSize: 14,
                                //             fontWeight: FontWeight.w600)),
                              ],
                            ),
                            const SizedBox(width: 60),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("$paymentStatus",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                              fontSize: 14,
                                              color: paymentStatus == "PAID"
                                                  ? Colors.green
                                                  : Colors.red)),
                                  const SizedBox(height: 20),
                                  Text("$paymentType",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500)),
                                  const SizedBox(height: 20),
                                  Text("$bankName",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500)),
                                  const SizedBox(height: 20),
                                  Text("$transactionDate",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500)),
                                  const SizedBox(height: 20),
                                  Text(
                                    "$toAccount",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 20),
                                  // Text('USD ${FormatToK.digitNumber(amount)}',
                                  //     style: Theme.of(context)
                                  //         .textTheme
                                  //         .headline2!
                                  //         .copyWith(
                                  //             fontSize: 14, color: Colors.red)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : isPayment == true
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Payment Status:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600)),
                                    const SizedBox(height: 20),
                                    Text("Payment Type:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600)),
                                    const SizedBox(height: 20),
                                    Text("Subscription ID:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600)),
                                    const SizedBox(height: 20),
                                    Text("Transaction Date:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600)),
                                    const SizedBox(height: 20),
                                    Text("From:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600)),
                                    const SizedBox(height: 20),
                                    // Text("Amount:",
                                    //     style: Theme.of(context)
                                    //         .textTheme
                                    //         .headline2!
                                    //         .copyWith(
                                    //             fontSize: 14,
                                    //             fontWeight: FontWeight.w600)),
                                  ],
                                ),
                                const SizedBox(width: 60),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("$paymentStatus",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: Colors.green)),
                                      const SizedBox(height: 20),
                                      Text("$paymentType".capitalize!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500)),
                                      const SizedBox(height: 20),
                                      Text(
                                          subscriptionID != null
                                              ? "$subscriptionID"
                                              : "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500)),
                                      const SizedBox(height: 20),
                                      Text("$transactionDate",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500)),
                                      const SizedBox(height: 20),
                                      Text(from != "" ? from! : "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500)),
                                      const SizedBox(height: 20),
                                      // Text(
                                      //     'USD ${FormatToK.digitNumber(amount)}',
                                      //     style: Theme.of(context)
                                      //         .textTheme
                                      //         .headline2!
                                      //         .copyWith(
                                      //             fontSize: 14,
                                      //             color: Colors.red)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : isCashin == true
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Payment Status:",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2!
                                                .copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                        const SizedBox(height: 20),
                                        Text("Payment Type:",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2!
                                                .copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                        const SizedBox(height: 20),
                                        Text("Bank Name:",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2!
                                                .copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                        const SizedBox(height: 20),
                                        Text("Transaction Date:",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2!
                                                .copyWith(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                        const SizedBox(height: 20),
                                        // Text("Amount:",
                                        //     style: Theme.of(context)
                                        //         .textTheme
                                        //         .headline2!
                                        //         .copyWith(
                                        //             fontSize: 14,
                                        //             fontWeight:
                                        //                 FontWeight.w600)),
                                      ],
                                    ),
                                    const SizedBox(width: 60),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("$paymentStatus".toUpperCase(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2!
                                                  .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.green)),
                                          const SizedBox(height: 20),
                                          Text("$paymentType".capitalize!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2!
                                                  .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                          const SizedBox(height: 20),
                                          Text(
                                              bankName != "" ? "$bankName" : "",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2!
                                                  .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                          const SizedBox(height: 20),
                                          Text("$transactionDate",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2!
                                                  .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                          const SizedBox(height: 20),
                                          // Text(
                                          //     'USD ${FormatToK.digitNumber(amount)}',
                                          //     style: Theme.of(context)
                                          //         .textTheme
                                          //         .headline2!
                                          //         .copyWith(
                                          //             fontSize: 14,
                                          //             fontWeight:
                                          //                 FontWeight.w500,
                                          //             color: Colors.green)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Subscription Status',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                              fontSize: 13,
                                            ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'Investor ID',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(fontSize: 13),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'Investor Name',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(fontSize: 13),
                                      ),
                                      const SizedBox(height: 20),
                                      Text('Price per UT',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(fontSize: 13)),
                                      const SizedBox(height: 5),
                                      Text(
                                        'Payment Status',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(fontSize: 13),
                                      ),
                                      const SizedBox(height: 5),
                                      Text('UT to Subscribe',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(fontSize: 13)),
                                      const SizedBox(height: 5),
                                      if (datePayment != null &&
                                          datePayment != '')
                                        Text(
                                          'Last Date of Payment',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(fontSize: 14),
                                        ),
                                    ]),
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '$subscriptionStatus'.toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .copyWith(
                                              color: subscriptionStatus ==
                                                      'WAITING'
                                                  ? AppColor.mainColor
                                                  : Colors.green,
                                              fontSize: 12,
                                            ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text('$investID',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(fontSize: 12)),
                                      const SizedBox(height: 5),
                                      Text('$investName'.toUpperCase(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(fontSize: 12)),
                                      const SizedBox(height: 20),
                                      Text(
                                          '${FormatToK.digitNumber(pricePerUT)} USD',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(fontSize: 12)),
                                      const SizedBox(height: 5),
                                      Text('$paymentStatus',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: paymentStatus ==
                                                          'NOT AVAILABLE'
                                                      ? Colors.grey
                                                      : paymentStatus ==
                                                              'UNPAID'
                                                          ? Colors.red
                                                          : paymentStatus ==
                                                                  'PARTIALLY PAID'
                                                              ? AppColor
                                                                      .statusColor[
                                                                  'pending']
                                                              : Colors.green,
                                                  fontWeight: FontWeight.w700)),
                                      const SizedBox(height: 5),
                                      Text('$utSubscribe UT',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(fontSize: 12)),
                                      const SizedBox(height: 5),
                                      // if (datePayment != null)
                                      Text('$datePayment',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(fontSize: 14)),
                                    ]),
                              ],
                            ),

          //// subscription status partailly paid

          if (paymentStatus == 'PARTIALLY PAID' ||
              paymentStatus == 'UNPAID' ||
              paymentStatus == 'NOT AVAILABLE')
            const SizedBox(height: 15),
          if (paymentStatus == 'PARTIALLY PAID' ||
              paymentStatus == 'UNPAID' ||
              paymentStatus == 'NOT AVAILABLE')
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Subscription Cost:',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontSize: 14)),
                        Text('${FormatToK.digitNumber(totalSubscription)} USD',
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(
                                    fontSize: 14,
                                    color: unPaidAmount == 0
                                        ? AppColor.statusColor['late']
                                        : AppColor.mainColor)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    if (unPaidAmount != 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Paid Amount:',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontSize: 14),
                          ),
                          if (unPaidAmount != 0)
                            Text('${FormatToK.digitNumber(unPaidAmount)} USD',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                        fontSize: 14,
                                        color: AppColor.mainColor)),
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
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${FormatToK.digitNumber(amountToPay)} USD',
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          const SizedBox(
            height: 20,
          ),
          CustomButton(
            title: paymentStatus == 'NOT AVAILABLE' ||
                    paymentStatus == 'PAID' ||
                    type == "cash-in" ||
                    type == "cash-out"
                ? 'Close'
                : 'Make Payment Now',
            isDisable: false,
            isOutline: false,
            onPressed: paymentStatus == 'NOT AVAILABLE' ||
                    paymentStatus == 'PAID' ||
                    type == "cash-in" ||
                    type == "cash-out"
                ? () {
                    Navigator.pop(context);
                  }
                : onTab,
          ),
          const SizedBox(
            height: 10,
          ),
          // const Text('hello'),
        ],
      ),
    );
  }
}
