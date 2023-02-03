import 'dart:io';

import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/modules/get_funding/models/payment_model/payment.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/widgets/get_funding/payment/transfer_by.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../Utils/helper/textstyle.dart';

class PayOffSlip extends StatefulWidget {
  final Payment? payment;
  const PayOffSlip({Key? key, this.payment}) : super(key: key);
  @override
  State<PayOffSlip> createState() => _PayOffSlipState();
}

class _PayOffSlipState extends State<PayOffSlip> {
  double? duration;
  double? remainDucation;
  double? completeDurationPercent;
  double? remainDurationpercent;
  bool isPayoff = false;

  @override
  void initState() {
    duration = widget.payment!.payOff!.duration!.toDouble();
    remainDucation = widget.payment!.payOff!.durationPaid!.toDouble() * 100;
    completeDurationPercent = remainDucation! / duration!;
    remainDurationpercent = 100 - completeDurationPercent!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  context: context,
                  title: S.of(context).payOff,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: kIsWeb
                        ? Icon(
                            Icons.arrow_back,
                            color: Get.theme.brightness == Brightness.light
                                ? Colors.white
                                : Theme.of(context).primaryColor,
                          )
                        : Platform.isAndroid
                            ? Icon(
                                Icons.arrow_back,
                                color: Get.theme.brightness == Brightness.light
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                              )
                            : Icon(
                                Icons.arrow_back_ios,
                                color: Get.theme.brightness == Brightness.light
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                              ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 70.0),
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 20.0),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(S.of(context).id,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(widget.payment!.code!,
                                        style: TextStyles.textStyle),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.all(0.0),
                                  child: Text(
                                    S.of(context).proccessing,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(S.of(context).item,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(widget.payment!.payOff!.item!,
                                          style: TextStyles.textStyle),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(S.of(context).duration,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                          widget.payment!.payOff!.duration!
                                              .toString(),
                                          style: TextStyles.textStyle),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(S.of(context).amount,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(widget.payment!.payOff!.amount!,
                                          style: TextStyles.textStyle),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(S.of(context).amountPaid,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(widget.payment!.payOff!.amountPaid!,
                                          style: TextStyles.textStyle),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    alignment: Alignment.center,
                                  ),
                                )
                              ],
                            ),
                            Text(S.of(context).totalAmount,
                                style:
                                    Theme.of(context).textTheme.displaySmall),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(widget.payment!.payOff!.totalPayment!,
                                style: TextStyles.textStyle),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: CustomButton(
                          isDisable: false,
                          isOutline: false,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TransferPage(
                                          paymentType: 'Payoff',
                                          payment: widget.payment,
                                        )));
                          },
                          title: S.of(context).payOff,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          isPayoff
              ? Positioned(
                  bottom: 20.0,
                  left: 20.0,
                  right: 20.0,
                  child: CustomButton(
                    onPressed: () {},
                    title: 'Pay Off',
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
