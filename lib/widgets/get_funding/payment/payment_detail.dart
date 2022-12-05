// ignore_for_file: deprecated_member_use

import 'package:cicgreenloan/generated/l10n.dart';

import 'package:cicgreenloan/modules/get_funding/models/payment_model/payment.dart';
import 'package:cicgreenloan/widgets/get_funding/payment/review_payment.dart';
import 'package:cicgreenloan/widgets/get_funding/payment/transfer_by.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import '../../../Utils/helper/color.dart';
import '../../../Utils/helper/custom_appbar.dart';
import '../../../Utils/helper/textstyle.dart';
import 'pay_off_slip.dart';
import 'dart:io' show Platform;

class PaymentDetail extends StatefulWidget {
  final Payment? payment;
  // final List<ScheduleList> scheduleList = [];
  const PaymentDetail({Key? key, this.payment}) : super(key: key);
  @override
  State<PaymentDetail> createState() => _PaymentDetailState();
}

class _PaymentDetailState extends State<PaymentDetail> {
  double? duration;
  double? remainDucation;
  double? remainDurationpercent;
  double? completeDurationPercent;
  Map<String, double> dataMap = {'totalPay': 13, 'Paid': 7};
  // List<CircularStackEntry> initialData = <CircularStackEntry>[
  //   new CircularStackEntry(
  //     <CircularSegmentEntry>[
  //       new CircularSegmentEntry(500.0, Colors.red[200], rankKey: 'Q1'),
  //       new CircularSegmentEntry(1000.0, Colors.green[200], rankKey: 'Q2'),
  //     ],
  //     rankKey: 'Quarterly Profits',
  //   ),
  // ];

  @override
  void initState() {
    setState(() {
      duration = widget.payment!.payOff!.duration!.toDouble();
      remainDucation = widget.payment!.payOff!.durationPaid!.toDouble() * 100;
      completeDurationPercent = remainDucation! / duration!;
      remainDurationpercent = 100 - completeDurationPercent!;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: widget.payment!.code!,
        leading: IconButton(
          icon: kIsWeb
              ? const Icon(Icons.arrow_back)
              : Platform.isIOS
                  ? const Icon(Icons.arrow_back_ios)
                  : const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 20.0,
              ),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: const Color(0xffFFFAE8),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 3,
                      color: Colors.black12),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).paymentDate,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            widget.payment!.paymentDate!,
                            style: TextStyles.textStyle,
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.all(0.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            backgroundColor:
                                widget.payment!.payNow!.rebate!.status ==
                                        'Reject'
                                    ? Colors.red
                                    : Theme.of(context).primaryColor,
                          ),
                          child: Text(
                            widget.payment!.payNow!.rebate!.status == 'Pending'
                                ? S.of(context).pending
                                : widget.payment!.payNow!.rebate!.status ==
                                        'Reject'
                                    ? S.of(context).rejected
                                    : S.of(context).paynow,
                            style: Theme.of(context).textTheme.button,
                          ),
                          onPressed: () {
                            widget.payment!.payNow!.rebate!.status == 'Pending'
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ReviewPayment(
                                              paymentType: 'Pay',
                                              payment: widget.payment,
                                            )))
                                : widget.payment!.payNow!.rebate!.status ==
                                        'Reject'
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ReviewPayment(
                                                  paymentType: 'Pay',
                                                  payment: widget.payment,
                                                )))
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => TransferPage(
                                                  payment: widget.payment,
                                                  paymentType: 'Pay',
                                                )),
                                      );
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).principle,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              widget.payment!.payNow!.principle!,
                              style: TextStyles.textStyle,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).interest,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              widget.payment!.payNow!.interest!,
                              style: TextStyles.textStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).penalty,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              widget.payment!.payNow!.penalty!,
                              style: TextStyles.textStyle,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).fee,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(widget.payment!.payNow!.fee!,
                                style: TextStyles.textStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).extra,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              widget.payment!.payNow!.penalty!,
                              style: TextStyles.textStyle,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).totalAmount,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              widget.payment!.amount!,
                              style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.textColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 3,
                      color: Colors.black12),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${S.of(context).id} ',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(widget.payment!.code!,
                              style: Theme.of(context).textTheme.bodyText2),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.all(0.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            backgroundColor:
                                widget.payment!.payOff!.rebate!.status ==
                                        'Reject'
                                    ? Colors.red
                                    : Theme.of(context).primaryColor,
                          ),
                          child: widget.payment!.payOff!.rebate!.status ==
                                  'Pending'
                              ? Text(S.of(context).pending,
                                  style: Theme.of(context).textTheme.button)
                              : widget.payment!.payOff!.rebate!.status ==
                                      'Reject'
                                  ? Text(S.of(context).rejected,
                                      style: Theme.of(context).textTheme.button)
                                  : Text(S.of(context).payOff,
                                      style:
                                          Theme.of(context).textTheme.button),
                          onPressed: () {
                            widget.payment!.payOff!.rebate!.status == 'Pending'
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ReviewPayment(
                                              paymentType: 'Payoff',
                                              payment: widget.payment,
                                            )))
                                : widget.payment!.payOff!.rebate!.status ==
                                        'Reject'
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ReviewPayment(
                                                  paymentType: 'Payoff',
                                                  payment: widget.payment,
                                                )))
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PayOffSlip(
                                              payment: widget.payment),
                                        ),
                                      );
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).item,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(widget.payment!.payOff!.item!,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyText2),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              S.of(context).duration,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text((widget.payment!.payOff!.duration).toString(),
                                style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).amount,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(widget.payment!.payOff!.amount!,
                                style: Theme.of(context).textTheme.bodyText2),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              S.of(context).amountPaid,
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(widget.payment!.payOff!.amountPaid!,
                                style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.center,
                          // child: AnimatedCircularChart(
                          //   size: const Size(100.0, 100.0),
                          //   initialChartData: <CircularStackEntry>[
                          //     CircularStackEntry(
                          //       <CircularSegmentEntry>[
                          //         CircularSegmentEntry(
                          //           completeDurationPercent,
                          //           Theme.of(context).primaryColor,
                          //           rankKey: 'completed',
                          //         ),
                          //         CircularSegmentEntry(
                          //           remainDurationpercent,
                          //           Colors.black12,
                          //           rankKey: 'remaining',
                          //         ),
                          //       ],
                          //       rankKey: 'progress',
                          //     ),
                          //   ],
                          //   chartType: CircularChartType.Radial,
                          //   percentageValues: true,
                          //   holeRadius: 20.0,
                          //   holeLabel:
                          //       '${widget.payment.payOff.durationPaid}/${widget.payment.payOff.duration}',
                          //   labelStyle: TextStyle(
                          //     color: Colors.blueGrey[600],
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 14.0,
                          //   ),
                          // ),
                        ),
                      )
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
}
