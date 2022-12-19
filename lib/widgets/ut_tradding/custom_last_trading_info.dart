// ignore_for_file: constant_identifier_names

import 'package:cicgreenloan/Utils/function/date_range_dialog.dart';
import 'package:cicgreenloan/modules/ut_trading/controllers/trading_controller.dart';
import 'package:cicgreenloan/Utils/option_controller/option_controller.dart';
import 'package:cicgreenloan/modules/ut_trading/models/last_trading_date_model.dart';
import 'package:cicgreenloan/widgets/ut_tradding/last_trading_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../Utils/helper/color.dart';
import '../bonus/custom_empty_state.dart';

enum BorderType {
  BorderLeft,
  BorderRight,
  All,
}

customAlertLastTradingInfo({
  required BuildContext context,
  bool isLoading = false,
  final int? id,
  final String? tradingstartDate,
  final Map? defaultValue,
  final ValueChanged<Map>? onChange,
  final String? title,
  final IconData? icon,
  currentIndex = 0,
  final TradingOption? lastTradingData,
  final List<TradingOption>? tradingOptionList,
}) {
  final lastTradingCon = Get.put(InquiryController());

  return Obx(
    () => SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.78,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 5,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300]),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(icon),
                  iconSize: 24),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Text(
                  title!,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 18),
                ),
              ),
              const Spacer(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Divider(
              thickness: 1.2,
              color: Colors.grey[300],
            ),
          ),
          Expanded(
            child: lastTradingCon.isLoadingCard.value
                ? const Center(child: CircularProgressIndicator())
                : lastTradingCon.lastTradingOptionModelList.isEmpty
                    ? const CustomEmptyState(
                        title: "No last trading information",
                        description: "It semms you have no trading info yet.",
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                dateRangDialog(
                                  context: context,
                                  contents: 'Date Range Presets',
                                  tradingOptionList:
                                      lastTradingCon.lastTradingOptionModelList,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200],
                                ),
                                width: double.infinity,
                                height: 60,
                                margin: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/tradingDate.svg",
                                      width: 20,
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                          "${tradingOptionList![lastTradingCon.lastTradinInfoIndex.value].date}"),
                                    ),
                                    const SizedBox(width: 5.0),
                                    const Icon(Icons.arrow_drop_down_sharp)
                                  ],
                                ),
                              ),
                            ),
                            Obx(
                              () => lastTradingCon.isLoadingCard.value
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                'Buy Side',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3!
                                                    .copyWith(
                                                        color: AppColor
                                                                .statusColor[
                                                            'late']),
                                              ),
                                              const Text('----'),
                                              LastTradingCard(
                                                title: 'Max Bid',
                                                price: lastTradingCon
                                                    .lastTradingCardModel
                                                    .value
                                                    .maxBid,
                                                color: AppColor
                                                    .statusColor['late'],
                                                borderType:
                                                    BorderType.BorderLeft,
                                                isPrice: true,
                                              ),
                                              LastTradingCard(
                                                title: 'Number of buyers',
                                                price: lastTradingCon
                                                    .lastTradingCardModel
                                                    .value
                                                    .numberOfBuyers,
                                                color: AppColor
                                                    .statusColor['late'],
                                                borderType:
                                                    BorderType.BorderLeft,
                                              ),
                                              LastTradingCard(
                                                title: 'UT Bought',
                                                price: lastTradingCon
                                                    .lastTradingCardModel
                                                    .value
                                                    .utBought,
                                                color: AppColor
                                                    .statusColor['late'],
                                                borderType:
                                                    BorderType.BorderLeft,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                'Matching Result',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3!
                                                    .copyWith(
                                                        color: AppColor
                                                                .statusColor[
                                                            'pending']),
                                              ),
                                              const Text('----'),
                                              LastTradingCard(
                                                title: 'Max Price',
                                                price: lastTradingCon
                                                    .lastTradingCardModel
                                                    .value
                                                    .maxPrice,
                                                color: AppColor
                                                    .statusColor['pending'],
                                                borderType: BorderType.All,
                                                isPrice: true,
                                              ),
                                              LastTradingCard(
                                                title: 'Min Price',
                                                price: lastTradingCon
                                                    .lastTradingCardModel
                                                    .value
                                                    .minPrice,
                                                color: AppColor
                                                    .statusColor['pending'],
                                                borderType: BorderType.All,
                                                isPrice: true,
                                              ),
                                              LastTradingCard(
                                                title: 'UT Matched',
                                                price: lastTradingCon
                                                    .lastTradingCardModel
                                                    .value
                                                    .utMatched,
                                                color: AppColor
                                                    .statusColor['pending'],
                                                borderType: BorderType.All,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                'Sell Side',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3!
                                                    .copyWith(
                                                        color: AppColor
                                                                .statusColor[
                                                            'green']),
                                              ),
                                              const Text('----'),
                                              LastTradingCard(
                                                title: 'Min Ask',
                                                price: lastTradingCon
                                                    .lastTradingCardModel
                                                    .value
                                                    .minAsk,
                                                color: AppColor
                                                    .statusColor['green'],
                                                borderType:
                                                    BorderType.BorderRight,
                                                isPrice: true,
                                              ),
                                              LastTradingCard(
                                                title: 'Number of Sellers',
                                                price: lastTradingCon
                                                    .lastTradingCardModel
                                                    .value
                                                    .numberOfSellers,
                                                color: AppColor
                                                    .statusColor['green'],
                                                borderType:
                                                    BorderType.BorderRight,
                                              ),
                                              LastTradingCard(
                                                title: 'UT Sold',
                                                price: lastTradingCon
                                                    .lastTradingCardModel
                                                    .value
                                                    .utSold,
                                                color: AppColor
                                                    .statusColor['green'],
                                                borderType:
                                                    BorderType.BorderRight,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ],
                        ),
                      ),
          ),
        ],
      ),
    ),
  );
}

class CustomLastTradingTap extends StatefulWidget {
  const CustomLastTradingTap({
    Key? key,
    this.lastTradingModel,
    this.title,
    this.icon,
  }) : super(key: key);
  final TradingOption? lastTradingModel;
  final String? title;
  final IconData? icon;
  @override
  State<CustomLastTradingTap> createState() => _CustomLastTradingTapState();
}

class _CustomLastTradingTapState extends State<CustomLastTradingTap>
    with SingleTickerProviderStateMixin {
  final tradeCon = Get.put(InquiryController());
  final docTypeCon = Get.put(DocumentCategory());
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  String? tradingstartDate;
  Map? defaultValue;
  int currentaIndex = 0;
  bool isTabSelected = false;

  @override
  void dispose() {
    tradeCon.tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tradeCon.tabController = TabController(
        vsync: this, length: 3, initialIndex: tradeCon.tapcurrentIndex.value);
    tradeCon.tabController.addListener(() {
      setState(() {
        tradeCon.tapcurrentIndex.value = tradeCon.tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.78,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 0, right: 0, top: 0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300]),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(widget.icon),
                        iconSize: 24),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text(
                        widget.title!,
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontSize: 18),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Divider(
                    thickness: 1.2,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      dateRangDialog(
                        context: Get.context,
                        contents: 'Date Range Presets',
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      width: double.infinity,
                      height: 60,
                      margin: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/tradingDate.svg",
                            width: 20,
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Friday, 04 July 2021"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 350,
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: TabBar(
                            controller: tradeCon.tabController,
                            dragStartBehavior: DragStartBehavior.start,
                            // isScrollable: true,

                            onTap: (int index) {
                              tradeCon.tabIndex.value = index;
                            },
                            labelColor: Colors.green,
                            indicatorColor: Colors.grey[300],
                            indicatorSize: TabBarIndicatorSize.label,
                            labelStyle: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontSize: 13, fontWeight: FontWeight.w500),
                            tabs: [
                              Tab(
                                child: Text("Buy Side",
                                    style: TextStyle(
                                        color: AppColor.statusColor['late'])),
                              ),
                              Tab(
                                child: Text(
                                  'Matching Result',
                                  style: TextStyle(
                                      color: AppColor.statusColor['pending']),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Sell Side',
                                  style: TextStyle(
                                      color: AppColor.statusColor['green']),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            dragStartBehavior: DragStartBehavior.start,
                            controller: tradeCon.tabController,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 60),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          // LastTradingCard(
                                          //   title: 'Max Bid',
                                          //   color:
                                          //       AppColor.statusColor['late'],
                                          //   borderType: BorderType.BorderLeft,
                                          //   price: widget.lastTradingModel!
                                          //       .info!.maxBid,
                                          // ),
                                          // LastTradingCard(
                                          //   title: 'Number of buyers',
                                          //   color:
                                          //       AppColor.statusColor['late'],
                                          //   borderType: BorderType.BorderLeft,
                                          //   price: widget.lastTradingModel!
                                          //       .info!.numberOfBuyers,
                                          // ),
                                          // LastTradingCard(
                                          //   title: 'UT Bought',
                                          //   color:
                                          //       AppColor.statusColor['late'],
                                          //   borderType: BorderType.BorderLeft,
                                          //   price: widget.lastTradingModel!
                                          //       .info!.utBought,
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.grey[350],
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.grey[350],
                                      )),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        // LastTradingCard(
                                        //   title: 'Max Price',
                                        //   color:
                                        //       AppColor.statusColor['pending'],
                                        //   borderType: BorderType.All,
                                        //   price: widget.lastTradingModel!
                                        //       .info!.maxPrice,
                                        // ),
                                        // LastTradingCard(
                                        //   title: 'Min Price',
                                        //   color:
                                        //       AppColor.statusColor['pending'],
                                        //   borderType: BorderType.All,
                                        //   price: tradeCon.lastTradingInfoModel
                                        //       .value.info!.minPrice,
                                        // ),
                                        // LastTradingCard(
                                        //   title: 'UT Matched',
                                        //   color:
                                        //       AppColor.statusColor['pending'],
                                        //   borderType: BorderType.All,
                                        //   price: widget.lastTradingModel!
                                        //       .info!.utMatched,
                                        // ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.grey[350],
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.grey[350],
                                      )),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 60),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          // LastTradingCard(
                                          //   title: 'Min Ask',
                                          //   color:
                                          //       AppColor.statusColor['green'],
                                          //   borderType:
                                          //       BorderType.BorderRight,
                                          //   price: widget.lastTradingModel!
                                          //       .info!.minAsk,
                                          // ),
                                          // LastTradingCard(
                                          //   title: 'Number of Sellers',
                                          //   color:
                                          //       AppColor.statusColor['green'],
                                          //   borderType:
                                          //       BorderType.BorderRight,
                                          //   price: widget.lastTradingModel!
                                          //       .info!.numberOfSellers,
                                          // ),
                                          // LastTradingCard(
                                          //   title: 'UT Sold',
                                          //   color:
                                          //       AppColor.statusColor['green'],
                                          //   borderType:
                                          //       BorderType.BorderRight,
                                          //   price: widget.lastTradingModel!
                                          //       .info!.utSold,
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
