import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/Utils/image_view/image_view_file.dart';
import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/modules/get_funding/models/payment_model/payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewPayment extends StatefulWidget {
  final Payment? payment;
  final String? paymentType;
  const ReviewPayment({Key? key, this.payment, this.paymentType})
      : super(key: key);

  @override
  State<ReviewPayment> createState() => _ReviewPaymentState();
}

class _ReviewPaymentState extends State<ReviewPayment> {
  late double duration;
  late double remainDucation;
  late double completeDurationPercent;
  late double remainDurationpercent;

  @override
  void initState() {
    duration = widget.payment!.payOff!.duration!.toDouble();
    remainDucation = widget.payment!.payOff!.durationPaid!.toDouble() * 100;
    completeDurationPercent = remainDucation / duration;
    remainDurationpercent = 100 - completeDurationPercent;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Payment'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 20.0,
                    ),
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
                          children: [
                            Text(
                              widget.paymentType == 'Pay'
                                  ? widget.payment!.payNow!.rebate!.bankName!
                                  : widget.payment!.payOff!.rebate!.bankName!,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            const Spacer(),
                            Container(
                              height: 50,
                              width: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      widget.paymentType == 'Pay'
                                          ? widget.payment!.payNow!.rebate!
                                              .bankLogo!
                                          : widget.payment!.payOff!.rebate!
                                              .bankLogo!),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Divider(
                          color: Theme.of(context).primaryColor,
                          thickness: 1,
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
                                    S.of(context).paymentDate,
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    widget.paymentType == 'Pay'
                                        ? widget.payment!.payNow!.rebate!.date!
                                        : widget.payment!.payOff!.rebate!.date!,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
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
                                    S.of(context).amount,
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    widget.paymentType == 'Pay'
                                        ? widget
                                            .payment!.payNow!.rebate!.amount!
                                        : widget
                                            .payment!.payOff!.rebate!.amount!,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
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
                                    S.of(context).bank,
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    widget.paymentType == 'Pay'
                                        ? widget
                                            .payment!.payNow!.rebate!.bankName!
                                        : widget
                                            .payment!.payOff!.rebate!.bankName!,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
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
                                    S.of(context).paymentStatus,
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  widget.paymentType == 'Pay'
                                      ? Text(
                                          widget.payment!.payNow!.rebate!.status! ==
                                                  'Pending'
                                              ? S.of(context).pending
                                              : widget.payment!.payNow!.rebate!.status! ==
                                                      'Reject'
                                                  ? S.of(context).rejected
                                                  : '',
                                          style: widget.payment!.payNow!.rebate!
                                                      .status! ==
                                                  'Reject'
                                              ? Get.theme.brightness ==
                                                      Brightness.dark
                                                  ? const TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red)
                                                  : const TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.red)
                                              : Get.theme.brightness ==
                                                      Brightness.dark
                                                  ? const TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)
                                                  : const TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black))
                                      : Text(
                                          widget.payment!.payOff!.rebate!.status! ==
                                                  'Pending'
                                              ? S.of(context).pending
                                              : widget.payment!.payOff!.rebate!
                                                          .status! ==
                                                      'Reject'
                                                  ? S.of(context).rejected
                                                  : '',
                                          style: widget.payment!.payOff!.rebate!
                                                      .status! ==
                                                  'Reject'
                                              ? Get.theme.brightness == Brightness.dark
                                                  ? const TextStyle(fontFamily: 'Montserrat', fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red)
                                                  : const TextStyle(fontFamily: 'Montserrat', fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red)
                                              : Get.theme.brightness == Brightness.dark
                                                  ? const TextStyle(fontFamily: 'Montserrat', fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)
                                                  : const TextStyle(fontFamily: 'Montserrat', fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  widget.paymentType == 'Pay'
                      ? widget.payment!.payNow!.rebate!.status! == 'Reject'
                          ? Container(
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Reason',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    widget.payment!.payNow!.rebate!.reason!,
                                    textAlign: TextAlign.justify,
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ],
                              ),
                            )
                          : Container()
                      : widget.payment!.payOff!.rebate!.status! == 'Reject'
                          ? Container(
                              margin:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Reason',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    widget.payment!.payOff!.rebate!.reason!,
                                    textAlign: TextAlign.justify,
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                  if (widget.payment!.payNow!.rebate!.status! == 'Reject' &&
                      widget.paymentType == 'Pay')
                    const SizedBox(height: 20.0),
                  if (widget.payment!.payOff!.rebate!.status! == 'Reject' &&
                      widget.paymentType == 'Payoff')
                    const SizedBox(height: 20.0),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Invoice',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        height: 400.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                        ),
                        child: Stack(
                          children: [
                            Hero(
                              tag: 'invoice',
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ImageViewerFile(
                                        heroTag: 'invoice',
                                        imageUrl: widget
                                            .payment!.payNow!.rebate!.image!,
                                      ),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: CachedNetworkImage(
                                      imageUrl: widget
                                          .payment!.payNow!.rebate!.image!,
                                      fit: BoxFit.cover,
                                      fadeInCurve: Curves.easeIn,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
