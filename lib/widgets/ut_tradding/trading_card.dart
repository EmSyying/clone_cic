// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/ut_trading/controllers/trading_controller.dart';
import 'package:cicgreenloan/modules/ut_trading/models/trading_model.dart';
import 'package:cicgreenloan/modules/ut_trading/screens/market_close_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class InquiryCard extends StatefulWidget {
  final String? status;
  final InquiryModel? inquiryModel;

  const InquiryCard({Key? key, this.inquiryModel, this.status})
      : super(key: key);

  @override
  State<InquiryCard> createState() => _InquiryCardState();
}

class _InquiryCardState extends State<InquiryCard> {
  final cusController = Get.put(CustomerController());

  final inquirycontroller = Get.put(InquiryController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12, offset: Offset(1.0, 0.0), blurRadius: 4.0)
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                color: widget.inquiryModel!.operation!.toLowerCase() == 'buy'
                    ? const Color(0xff75BF72)
                    : const Color(0xffED1E26)),
            height: 90,
            width: 7,
          ),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: widget.inquiryModel!.operation!.toLowerCase() == 'buy' &&
                        widget.inquiryModel!.tradingWith == 'specific-platform'
                    ? SvgPicture.asset(
                        'assets/images/svgfile/bywithspecific.svg',
                        height: 35,
                      )
                    : widget.inquiryModel!.operation!.toLowerCase() == 'buy'
                        ? SvgPicture.asset(
                            'assets/images/svgfile/tradewithcicplatform.svg',
                            height: 35,
                          )
                        : widget.inquiryModel!.operation!.toLowerCase() ==
                                    'sell' &&
                                widget.inquiryModel!.tradingWith ==
                                    'specific-platform'
                            ? SvgPicture.asset(
                                'assets/images/svgfile/sellwithspecific.svg',
                                height: 35,
                              )
                            : SvgPicture.asset(
                                'assets/images/svgfile/sellwihtcicplatform.svg',
                                height: 35,
                              ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.inquiryModel!.operation!.capitalize} Request',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        'Payment :',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        widget.inquiryModel!.payment == false &&
                                widget.inquiryModel!.type!.toLowerCase() ==
                                    'matched'
                            ? ' Not Yet'
                            : widget.inquiryModel!.payment == true &&
                                    widget.inquiryModel!.type!.toLowerCase() ==
                                        'matched'
                                ? ' Done'
                                : ' N/A',
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (widget.status == 'All')
                    Text(
                      widget.inquiryModel!.type!.capitalize!,
                      style: TextStyle(
                          fontSize: 14,
                          color: widget.inquiryModel!.type!.toLowerCase() ==
                                  'submitted'
                              ? const Color(0xff0685CF)
                              : widget.inquiryModel!.type!.toLowerCase() ==
                                      'unmatched'
                                  ? const Color(0xffE28112)
                                  : widget.inquiryModel!.type!.toLowerCase() ==
                                          'matched'
                                      ? Colors.green
                                      : widget.inquiryModel!.type!
                                                  .toLowerCase() ==
                                              'in progress'
                                          ? const Color(0xff0685CF)
                                          : Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.inquiryModel!.time!,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
              IconButton(
                icon: GestureDetector(
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.grey[500],
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      context: context,
                      builder: (context) => ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              color: Theme.of(context).cardColor,
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: widget.inquiryModel!.type!
                                                .toLowerCase() ==
                                            'submitted'
                                        ? () {
                                            if (inquirycontroller
                                                .tradingSettingData
                                                .data!
                                                .market!
                                                .open!) {
                                              Navigator.pop(context);

                                              context.pushNamed('AddInquiry',
                                                  params: {
                                                    "operation": widget
                                                        .inquiryModel!.operation
                                                        .toString()
                                                  },
                                                  queryParams: {
                                                    "date": widget
                                                        .inquiryModel!.date
                                                        .toString(),
                                                    "description": widget
                                                        .inquiryModel!
                                                        .description
                                                        .toString(),
                                                    "id": widget
                                                        .inquiryModel!.id
                                                        .toString(),
                                                    "marketId": widget
                                                        .inquiryModel!.marketId
                                                        .toString(),
                                                    "memberId": widget
                                                        .inquiryModel!.memberId
                                                        .toString(),
                                                    "numberOfShare": widget
                                                        .inquiryModel!
                                                        .numberOfShare
                                                        .toString(),
                                                    "payment": widget
                                                        .inquiryModel!.payment
                                                        .toString(),
                                                    "price": widget
                                                        .inquiryModel!.price
                                                        .toString(),
                                                    "targetMember": widget
                                                        .inquiryModel!
                                                        .targetMember
                                                        .toString(),
                                                    "time": widget
                                                        .inquiryModel!.time
                                                        .toString(),
                                                    "tradingWith": widget
                                                        .inquiryModel!
                                                        .tradingWith
                                                        .toString(),
                                                    "type": widget
                                                        .inquiryModel!.type
                                                        .toString()
                                                  });
                                            } else if (widget.inquiryModel!
                                                    .tradingWith ==
                                                'specific-platform') {
                                              Navigator.pop(context);

                                              context.pushNamed('AddInquiry',
                                                  params: {
                                                    "operation": widget
                                                        .inquiryModel!.operation
                                                        .toString()
                                                  },
                                                  queryParams: {
                                                    "date": widget
                                                        .inquiryModel!.date
                                                        .toString(),
                                                    "description": widget
                                                        .inquiryModel!
                                                        .description
                                                        .toString(),
                                                    "id": widget
                                                        .inquiryModel!.id
                                                        .toString(),
                                                    "marketId": widget
                                                        .inquiryModel!.marketId
                                                        .toString(),
                                                    "memberId": widget
                                                        .inquiryModel!.memberId
                                                        .toString(),
                                                    "numberOfShare": widget
                                                        .inquiryModel!
                                                        .numberOfShare
                                                        .toString(),
                                                    "payment": widget
                                                        .inquiryModel!.payment
                                                        .toString(),
                                                    "price": widget
                                                        .inquiryModel!.price
                                                        .toString(),
                                                    "targetMember": widget
                                                        .inquiryModel!
                                                        .targetMember
                                                        .toString(),
                                                    "time": widget
                                                        .inquiryModel!.time
                                                        .toString(),
                                                    "tradingWith": widget
                                                        .inquiryModel!
                                                        .tradingWith
                                                        .toString(),
                                                    "type": widget
                                                        .inquiryModel!.type
                                                        .toString()
                                                  });
                                            } else {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const MarketCloseScreen()));
                                            }
                                          }
                                        : null,
                                    child: Container(
                                      color: Theme.of(context).cardColor,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.border_color,
                                              color: widget.inquiryModel!.type!
                                                          .toLowerCase() ==
                                                      'submitted'
                                                  ? const Color(0XFF000000)
                                                  : Colors.grey,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Edit',
                                              style: TextStyle(
                                                  color: widget.inquiryModel!
                                                              .type!
                                                              .toLowerCase() ==
                                                          'submitted'
                                                      ? const Color(0XFF000000)
                                                      : Colors.grey,
                                                  fontSize: 16),
                                            )
                                          ]),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: widget.inquiryModel!.type!
                                                .toLowerCase() ==
                                            'submitted'
                                        ? () {
                                            Navigator.pop(context);
                                            kIsWeb
                                                ? showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                          'Are you sure! you want to cancel ?',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .headline2,
                                                        ),
                                                        actions: [
                                                          FlatButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                'No',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'DMSans')),
                                                          ),
                                                          FlatButton(
                                                            onPressed:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                              await inquirycontroller
                                                                  .onDeleteInquiry(
                                                                      widget
                                                                          .inquiryModel!
                                                                          .id!);
                                                            },
                                                            child: const Text(
                                                                'Yes',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'DMSans')),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  )
                                                : Platform.isIOS
                                                    ? showCupertinoDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return CupertinoAlertDialog(
                                                            content: Container(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            title: Text(
                                                              'Are you sure! you want to cancel ?',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline2,
                                                            ),
                                                            actions: [
                                                              CupertinoButton(
                                                                  child: const Text(
                                                                      'No',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'DMSans')),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  }),
                                                              CupertinoButton(
                                                                  child:
                                                                      const Text(
                                                                    'Yes',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'DMSans'),
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    Navigator.pop(
                                                                        context);
                                                                    await inquirycontroller
                                                                        .onDeleteInquiry(widget
                                                                            .inquiryModel!
                                                                            .id!);
                                                                  })
                                                            ],
                                                          );
                                                        })
                                                    : showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                              'Are you sure! you want to cancel ?',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headline2,
                                                            ),
                                                            actions: [
                                                              FlatButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: const Text(
                                                                    'No',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'DMSans')),
                                                              ),
                                                              FlatButton(
                                                                onPressed:
                                                                    () async {
                                                                  Navigator.pop(
                                                                      context);
                                                                  await inquirycontroller
                                                                      .onDeleteInquiry(widget
                                                                          .inquiryModel!
                                                                          .id!);
                                                                },
                                                                child: const Text(
                                                                    'Yes',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'DMSans')),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                          }
                                        : null,
                                    child: Container(
                                      color: Theme.of(context).cardColor,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            // SvgPicture.asset(inquiryModel!.type! ==
                                            //         'Submitted'
                                            //     ? 'assets/images/svgfile/enableDelete.svg'
                                            //     : 'assets/images/svgfile/disableDelete.svg'),
                                            Icon(
                                              Icons.block,
                                              color:
                                                  widget.inquiryModel!.type! ==
                                                          'Submitted'
                                                      ? const Color(0XFF000000)
                                                      : Colors.grey,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  color: widget.inquiryModel!
                                                              .type! ==
                                                          'Submitted'
                                                      ? const Color(0XFF000000)
                                                      : Colors.grey,
                                                  fontSize: 16),
                                            )
                                          ]),
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 1,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                        width: double.infinity,
                                        color: Theme.of(context).cardColor,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 15),
                                        child: Row(
                                          children: const [
                                            Icon(Icons.close),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Close',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ));
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}
