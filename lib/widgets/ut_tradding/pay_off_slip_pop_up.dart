import 'package:cicgreenloan/modules/ut_trading/models/detail_model.dart';
import 'package:cicgreenloan/widgets/ut_tradding/custom_column_header.dart';
import 'package:flutter/material.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';

import '../../Utils/helper/color.dart';
import '../../Utils/helper/format_number.dart';

showCustomDialog(
    {List<PayOffSlip> transactionDetailList = const [],
    List<Bank> paymentDetailList = const [],
    List<PayOffSlip> transactionFeeList = const [],
    List<PayOffSlip> totalPaymentList = const [],
    BuildContext? context,
    bool? status,
    String? operation,
    String? id,
    num transactionFee = 0,
    num totalPayment = 0,
    num feepercentage = 0.0,
    num atLessFeeamount = 0.0}) {
  num fee = 0;
  return showDialog(
    barrierDismissible: false,
    context: context!,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          for (var i = 0; i < transactionFeeList.length; i++) {
            transactionFee += transactionFeeList[i].price!.toDouble();
          }
          for (var i = 0; i < totalPaymentList.length; i++) {
            totalPayment += totalPaymentList[i].total!.toDouble();
          }
          setState(() => fee = (totalPayment * feepercentage) / 100);
          return AlertDialog(
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            titlePadding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: const EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        status == true ? 'Transaction Detail' : 'Payment Slip',
                        style: const TextStyle(
                            color: AppColor.textColor,
                            fontFamily: 'Poppin',
                            fontWeight: FontWeight.w800,
                            fontSize: 17),
                      ),
                    ),
                    SizedBox(
                      height: status! != true ? 0 : 15,
                    ),
                    Text(
                      status == true ? "Paid" : "",
                      style: const TextStyle(
                        color: Colors.green,
                        fontFamily: 'Poppin',
                      ),
                    ),
                    if (id != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Text(
                          'ID: $id',
                          style: const TextStyle(
                              color: AppColor.textColor,
                              fontFamily: 'Poppin',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    CustomColumnHeader(
                        transactionDetailList: transactionDetailList),
                    if (operation == 'sell')
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                        child: Row(
                          children: [
                            const Text('Transaction Fee',
                                style: TextStyle(
                                    color: AppColor.textColor,
                                    fontFamily: 'Poppin',
                                    fontSize: 12)),
                            const Spacer(),
                            fee < atLessFeeamount
                                ? Text(
                                    '- \$${FormatNumber.formatNumber(atLessFeeamount)}',
                                    style: const TextStyle(
                                        color: AppColor.textColor,
                                        fontFamily: 'Poppin',
                                        fontSize: 12))
                                : Text('- \$${FormatNumber.formatNumber(fee)}',
                                    style: const TextStyle(
                                        color: AppColor.textColor,
                                        fontFamily: 'Poppin',
                                        fontSize: 12)),
                          ],
                        ),
                      ),
                    if (operation == 'sell')
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Text(
                              operation == 'buy'
                                  ? 'Sub Total'
                                  : 'Recieve Payment',
                              style: const TextStyle(
                                  color: AppColor.textColor,
                                  fontFamily: 'Poppin',
                                  fontSize: 12),
                            ),
                            const Spacer(),
                            Text(
                              fee < atLessFeeamount
                                  ? '\$${FormatNumber.formatNumber(totalPayment - atLessFeeamount)}'
                                  : '\$${FormatNumber.formatNumber(totalPayment - fee)}',
                              style: TextStyle(
                                  color: operation == 'buy'
                                      ? AppColor.textColor
                                      : Colors.red,
                                  fontWeight: operation != 'buy'
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                  fontFamily: 'Poppin',
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    if (operation == 'buy')
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 40.0),
                        child: Row(
                          children: [
                            const Text(
                              'Total Payment',
                              style: TextStyle(
                                  color: AppColor.textColor,
                                  fontFamily: 'Poppin',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                            const Spacer(),
                            status == false
                                ? Text(
                                    fee < atLessFeeamount
                                        ? '\$${FormatNumber.formatNumber(totalPayment - atLessFeeamount)}'
                                        : '\$${FormatNumber.formatNumber(totalPayment - fee)}',
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontFamily: 'Poppin',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  )
                                : Text(
                                    '\$${FormatNumber.formatNumber(totalPayment)}',
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontFamily: 'Poppin',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ),
                          ],
                        ),
                      ),
                    if (operation != 'buy') const SizedBox(height: 30.0),
                    Row(children: [
                      Expanded(
                        child: SizedBox(
                          height: 50.0,
                          width: double.infinity,
                          // margin: EdgeInsets.only(
                          //     left: 15.0, top: 20.0, bottom: 25.0),
                          child: (CustomButton(
                            title: status == true ? "Close" : "OK",
                            isOutline: true,
                            isDisable: false,
                            onPressed: status == true
                                ? () async {
                                    //Cancel : when user tap cancel it will back

                                    Navigator.pop(context);
                                  }
                                : () {
                                    //Done when user tap Done it will route to Bank gateway

                                    Navigator.pop(context);
                                  },
                          )),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
