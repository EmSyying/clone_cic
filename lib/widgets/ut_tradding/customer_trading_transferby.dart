import 'package:cicgreenloan/modules/ut_trading/models/detail_model.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/widgets/ut_tradding/custom_bank_transfter_card.dart';
import 'package:cicgreenloan/widgets/ut_tradding/custom_column_header.dart';
import 'package:flutter/material.dart';

import '../../Utils/helper/color.dart';
import '../../Utils/helper/container_partern.dart';
import '../../Utils/helper/format_number.dart';

class CustomTradingTransferBy extends StatefulWidget {
  final List<Bank>? paymentDetailList;
  final List<PayOffSlip>? transactionDetailList;
  final String? id;
  final String? operation;
  final num? feepercentage;
  final num? atLessFeeamount;
  const CustomTradingTransferBy(
      {Key? key,
      this.atLessFeeamount,
      required this.feepercentage,
      required this.id,
      required this.paymentDetailList,
      required this.transactionDetailList,
      this.operation})
      : super(key: key);
  @override
  State<CustomTradingTransferBy> createState() =>
      _CustomTradingTransferByState();
}

class _CustomTradingTransferByState extends State<CustomTradingTransferBy> {
  num fee = 0;
  num totalPayment = 0;
  num transactionFee = 0;

  @override
  void initState() {
    for (var i = 0; i < widget.transactionDetailList!.length; i++) {
      transactionFee += widget.transactionDetailList![i].price!.toDouble();
    }
    for (var i = 0; i < widget.transactionDetailList!.length; i++) {
      totalPayment += widget.transactionDetailList![i].total!.toDouble();
    }
    setState(() => fee = (totalPayment * widget.feepercentage!) / 100);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.id != null)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, left: 20.0),
                              child: Text(
                                'Trans ID: ${widget.id}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          Container(
                            margin: const EdgeInsets.all(20.0),
                            padding: const EdgeInsets.all(20.0),
                            decoration: containerCiCPartern,
                            child: Column(children: [
                              CustomColumnHeader(
                                  transactionDetailList:
                                      widget.transactionDetailList!),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
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
                                    Text(
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
                            ]),
                          ),
                        ]),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 20.0),
                  child: const Text(
                    'Available Payment Accounts',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.paymentDetailList!.map((e) {
                      return CustomBankTransferCard(
                        bankDetail: e,
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
              border: BorderDirectional(
                top: BorderSide(
                    color: Colors.grey, width: 0.2, style: BorderStyle.solid),
              ),
              color: Colors.white),
          child: Container(
            height: 50.0,
            width: double.infinity,
            margin:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
            child: CustomButton(
              isDisable: false,
              isOutline: false,
              title: 'Close',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
