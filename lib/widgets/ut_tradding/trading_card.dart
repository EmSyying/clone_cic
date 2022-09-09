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
      height: 70,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          // boxShadow: const [
          //   BoxShadow(
          //       offset: Offset(1.0, 0.0), color: Colors.black12, blurRadius: 6)
          // ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: const Color(0XFFAFAFAF).withAlpha(75), width: 0.5),
          color: Colors.white),
      child: Row(
        children: [
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
                child: SvgPicture.asset(
                  widget.inquiryModel!.operation!.toLowerCase() == 'buy'
                      ? 'assets/images/svgfile/ut-buy-card.svg'
                      : 'assets/images/svgfile/ut-sell-card.svg',
                  // height: 35,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.inquiryModel!.operation!.capitalize} Request',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.inquiryModel!.time!,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: const Color(0XFF464646)),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // if (widget.status == 'All')
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text(
                      widget.inquiryModel!.type!.capitalize!,
                      style: TextStyle(
                          fontSize: 12,
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
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        'Payment :',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontSize: 12,
                            color: const Color(0XFF464646),
                            fontWeight: FontWeight.w700),
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
                            fontSize: 12,
                            color: Color(0XFF464646),
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ],
              ),
              IconButton(
                icon: GestureDetector(
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.grey[500],
                    size: 18,
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
