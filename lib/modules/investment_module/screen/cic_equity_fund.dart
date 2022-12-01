import 'dart:async';

import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:cicgreenloan/modules/investment_module/model/share_price_model.dart';

import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/modules/investment_module/screen/certificate.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../Utils/chart/line_chart.dart';
import '../../../Utils/helper/color.dart';
import '../../../Utils/helper/custom_appbar.dart';
import '../../../widgets/defualt_size_web.dart';
import '../../../widgets/investments/custom_card.dart';
import '../../../widgets/investments/equity_fund/subscription_chart.dart';
import '../../../widgets/investments/equity_fund/trading_chart.dart';
import '../../../widgets/investments/return_on_investment.dart';
import '../../guilder/guider_controller.dart';

class CiCEquityFund extends StatefulWidget {
  final bool? isNavigator;
  final bool isEquityTrue;
  const CiCEquityFund({Key? key, this.isEquityTrue = false, this.isNavigator})
      : super(key: key);

  @override
  State<CiCEquityFund> createState() => _CiCEquityFundState();
}

class _CiCEquityFundState extends State<CiCEquityFund> {
  final priceController = Get.put(PriceController());
  final bonusCon = Get.put(BonusController());
  var f = NumberFormat('#,###.00', 'en_US');
  var n = NumberFormat('#,###', 'en_US');
  bool isExpandShareSubscribe = false;
  bool isExpandInvestmentReturn = false;
  final _guidkey = Get.put(CiCGuidController());

  ///
  OverlayState? overlayState;
  OverlayEntry? overlayEntry;

  List<Evolution> reversList = [];
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  Future<void> onRefresh() async {
    await priceController.getSharePrice();
  }

  @override
  void initState() {
    priceController.isFromWallet.value = false;
    priceController.fetchCertificate();
    priceController.fetchOnReturnInvestment();
    priceController.getSharePrice();
    priceController.getShareSubHistories();
    priceController.getAllChartList();

    // priceController.fetchCertificate();
    super.initState();
  }

  int selectedSegment = 0;
  bool hide = false;
  final List<Widget> utChartHistory = [
    const SubscriptionChart(),
    const TradingChart(),
  ];

  @override
  Widget build(BuildContext context) {
    return widget.isEquityTrue == false
        ? SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: RefreshIndicator(
              key: refreshKey,
              onRefresh: onRefresh,
              child: ListView(
                controller: priceController.cicEquityScroll,
                padding: const EdgeInsets.only(bottom: 20),
                children: [
                  CustomCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/svgfile/shareInfo.svg',
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                'UT Information',
                                key: _guidkey.investmentKey[1].key =
                                    GlobalKey(),
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Current UT Price',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        fontFamily: 'DMSans',
                                        color: Colors.black54),
                                  ),
                                  Obx(
                                    () => priceController.price.value.price !=
                                            null
                                        ? Text(
                                            priceController.price.value.price!,
                                            // '\$${f.format(3022.23)}',

                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                                fontFamily: 'DMSans',
                                                color: Colors.black),
                                          )
                                        : Container(),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () async {
                                  debugPrint(
                                      "Certification:${priceController.certificate.value.data}");
                                  // context.push(
                                  // '/investment/cic-equity-fund/certificate??title=Something&urlAttachment=${priceController.certificate.value.data}');

                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PDFViewer(
                                          title: "Something",
                                          urlAttachment: priceController
                                              .certificate.value.data),
                                    ),
                                  );
                                },
                                child: Container(
                                  key: _guidkey.investmentKey[2].key =
                                      GlobalKey(),
                                  alignment: Alignment.center,
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withAlpha(16)),
                                  child: SvgPicture.asset(
                                    'assets/images/svgfile/pdfcertificate.svg',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/svgfile/totalShare.svg'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total UT',
                                          style: Get.theme.brightness ==
                                                  Brightness.light
                                              ? TextStyle(
                                                  color: Colors.grey[500],
                                                  fontFamily: 'DMSans')
                                              : const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'DMSans'),
                                        ),
                                        Obx(
                                          () => Text(
                                            priceController.sharePrice.value
                                                            .totalShareOutstanding !=
                                                        null &&
                                                    priceController
                                                            .sharePrice
                                                            .value
                                                            .totalShareOutstanding !=
                                                        0
                                                ? n.format(priceController
                                                    .sharePrice
                                                    .value
                                                    .totalShareOutstanding)
                                                : '0.0',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SvgPicture.asset(
                                  "assets/images/svgfile/investdivider.svg"),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 20.0),
                                    SvgPicture.asset(
                                        'assets/images/svgfile/totalNetworth.svg'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total UT Price',
                                          style: Get.theme.brightness ==
                                                  Brightness.light
                                              ? TextStyle(
                                                  color: Colors.grey[500],
                                                  fontFamily: 'DMSans')
                                              : const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'DMSans'),
                                        ),
                                        Obx(
                                          () => Text(
                                            priceController.sharePrice.value
                                                            .totalNetWorth !=
                                                        null &&
                                                    priceController
                                                            .sharePrice
                                                            .value
                                                            .totalNetWorth !=
                                                        0
                                                ? '\$${f.format(priceController.sharePrice.value.totalNetWorth)}'
                                                : '\$0.0',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        //   share price chart

                        ClipRect(
                          child: SizedBox(
                            height: 250,
                            child: Stack(
                              children: [
                                const SizedBox(
                                  height: double.infinity,
                                  width: double.infinity,
                                ),
                                Positioned(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'UT Price Evolution',
                                              key: _guidkey.investmentKey[3]
                                                  .key = GlobalKey(),
                                              style: Get.theme.brightness ==
                                                      Brightness.light
                                                  ? TextStyle(
                                                      color: Colors.grey[500],
                                                      fontFamily: 'DMSans')
                                                  : const TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'DMSans'),
                                            ),
                                            Text(
                                              'Figure in USD',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                Obx(
                                  () => priceController.isLoading.value
                                      ? Center(
                                          child: Container(),
                                        )
                                      : priceController
                                                  .sharePrice.value.evolution !=
                                              null
                                          ? Positioned(
                                              top: 50,
                                              left: 5,
                                              right: 5,
                                              bottom: 0,
                                              child: CiCLineChart(
                                                  dataList: priceController
                                                      .sharePrice
                                                      .value
                                                      .evolution!
                                                      .reversed
                                                      .toList()),
                                            )
                                          : Positioned(
                                              top: 50,
                                              left: 5,
                                              right: 5,
                                              bottom: 0,
                                              child: CiCLineChart(
                                                  dataList: reversList),
                                            ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => priceController.investDataList.isNotEmpty
                        ? const SizedBox(
                            height: 20,
                          )
                        : Container(),
                  ),
                  // Chhany
                  Obx(
                    () => priceController.isInvestLoading.value
                        ? Center(
                            child: Container(),
                          )
                        : priceController.investDataList.isNotEmpty
                            ? ReturnOnInvestment(
                                yearsList: priceController.investDataList,
                              )
                            : Container(),
                  ),

                  ///
                  // Container(
                  //   margin: const EdgeInsets.only(top: 10),
                  //   padding: const EdgeInsets.only(top: 20),
                  //   color: AppColor.backgroundColor,
                  //   child: Column(
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 20),
                  //         child: Row(
                  //           children: [
                  //             SvgPicture.asset(
                  //                 'assets/images/svgfile/ut_chart_history.dart.svg'),
                  //             const SizedBox(width: 10),
                  //             Text(
                  //               'UT Transaction History',
                  //               style:
                  //                   Theme.of(context).textTheme.headline2!.copyWith(
                  //                         fontWeight: FontWeight.w700,
                  //                       ),
                  //             ),
                  //             const Spacer(),
                  //             GestureDetector(
                  //               onTap: () {
                  //                 hide = !hide;
                  //                 setState(() {});
                  //               },
                  //               child: Text(
                  //                 hide ? 'Show' : 'Hide',
                  //                 style: Theme.of(context)
                  //                     .textTheme
                  //                     .headline3!
                  //                     .copyWith(
                  //                         fontWeight: FontWeight.w500,
                  //                         height: 0,
                  //                         decoration: TextDecoration.underline),
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //       hide
                  //           ? const SizedBox.shrink()
                  //           : Container(
                  //               margin: const EdgeInsets.symmetric(
                  //                   vertical: 20, horizontal: 20),
                  //               width: double.infinity,
                  //               child: CupertinoSlidingSegmentedControl(
                  //                 groupValue: selectedSegment,
                  //                 // backgroundColor: CupertinoColors.tertiarySystemFill,
                  //                 children: <int, Widget>{
                  //                   0: Padding(
                  //                     padding:
                  //                         const EdgeInsets.symmetric(vertical: 10),
                  //                     child: Text(
                  //                       'Subscription',
                  //                       style: Theme.of(context)
                  //                           .textTheme
                  //                           .subtitle2!
                  //                           .copyWith(fontSize: 13),
                  //                     ),
                  //                   ),
                  //                   1: Padding(
                  //                     padding:
                  //                         const EdgeInsets.symmetric(vertical: 10),
                  //                     child: Text(
                  //                       'Trading',
                  //                       style: Theme.of(context)
                  //                           .textTheme
                  //                           .subtitle2!
                  //                           .copyWith(fontSize: 13),
                  //                     ),
                  //                   ),
                  //                 },
                  //                 onValueChanged: (int? value) {
                  //                   selectedSegment = value!;

                  //                   setState(() {});
                  //                 },
                  //               ),
                  //             ),
                  //       hide
                  //           ? const SizedBox.shrink()
                  //           : utChartHistory[selectedSegment],
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),

                  ///
                  // const SizedBox(height: 20),
                  // Container(
                  //   margin: EdgeInsets.symmetric(horizontal: 20),
                  //   decoration: boxExpansion,
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(10),
                  //     child: ClipRect(
                  //       child: BackdropFilter(
                  //         filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                  //         child: Container(
                  //           // decoration: boxExpansion,
                  //           decoration: boxExpansion,
                  //           child: Theme(
                  //             data: Theme.of(context).copyWith(
                  //               // cardColor: Theme.of(context).cardColor
                  //               cardColor: Colors.grey.shade50.withOpacity(1),
                  //             ),
                  //             child: ExpansionPanelList(
                  //               animationDuration: Duration(milliseconds: 100),
                  //               elevation: 0,
                  //               expansionCallback: (index, isExpand) {
                  //                 setState(() {
                  //                   isExpandShareSubscribe = !isExpandShareSubscribe;
                  //                 });
                  //               },
                  //               children: [
                  //                 ExpansionPanel(
                  //                   canTapOnHeader: true,
                  //                   isExpanded: isExpandShareSubscribe,
                  //                   headerBuilder:
                  //                       (BuildContext context, bool isExpand) {
                  //                     return Padding(
                  //                       padding: const EdgeInsets.symmetric(
                  //                           horizontal: 20),
                  //                       child: Row(
                  //                         children: [
                  //                           SvgPicture.asset(
                  //                               'assets/images/svgfile/shareSubscribe.svg'),
                  //                           SizedBox(
                  //                             width: 10,
                  //                           ),
                  //                           Text(
                  //                             'UT Subscription History',
                  //                             // style: Theme.of(context)
                  //                             //     .textTheme
                  //                             //     .bodyText2,
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     );
                  //                   },
                  //                   body: Column(
                  //                     mainAxisAlignment: MainAxisAlignment.start,
                  //                     crossAxisAlignment: CrossAxisAlignment.start,
                  //                     children: [
                  //                       Padding(
                  //                         padding: const EdgeInsets.symmetric(
                  //                             horizontal: 20),
                  //                         child: Column(
                  //                           mainAxisAlignment:
                  //                               MainAxisAlignment.start,
                  //                           crossAxisAlignment:
                  //                               CrossAxisAlignment.start,
                  //                           children: [
                  //                             Text(
                  //                               'UT Balance By Year',
                  //                               style: Get.theme.brightness ==
                  //                                       Brightness.light
                  //                                   ? TextStyle(
                  //                                       color: Colors.grey[500],
                  //                                       fontFamily: 'DMSans')
                  //                                   : TextStyle(
                  //                                       color: Colors.white,
                  //                                       fontFamily: 'DMSans'),
                  //                             ),
                  //                             Text(
                  //                               'Figure in number of UT',
                  //                               style: Theme.of(context)
                  //                                   .textTheme
                  //                                   .bodyText1!
                  //                                   .copyWith(color: Colors.grey),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                       SizedBox(
                  //                         height: 10,
                  //                       ),
                  //                       Obx(
                  //                         () => CiCBarChartTradeByYear(
                  //                           barColor: Color(0xffE28112),
                  //                           dataList: priceController
                  //                               .shareSubscriptionTradeByYearDataList
                  //                               .toList(),
                  //                         ),
                  //                       ),
                  //                       SizedBox(
                  //                         height: 10,
                  //                       ),
                  //                       Divider(
                  //                         thickness: 1,
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.symmetric(
                  //                             horizontal: 20),
                  //                         child: Column(
                  //                           mainAxisAlignment:
                  //                               MainAxisAlignment.start,
                  //                           crossAxisAlignment:
                  //                               CrossAxisAlignment.start,
                  //                           children: [
                  //                             Text(
                  //                               'UT Subscription By Year',
                  //                               style: Get.theme.brightness ==
                  //                                       Brightness.light
                  //                                   ? TextStyle(
                  //                                       color: Colors.grey[500],
                  //                                       fontFamily: 'DMSans')
                  //                                   : TextStyle(
                  //                                       color: Colors.white,
                  //                                       fontFamily: 'DMSans'),
                  //                             ),
                  //                             Text(
                  //                               'Figure in number of UT',
                  //                               style: Theme.of(context)
                  //                                   .textTheme
                  //                                   .bodyText1!
                  //                                   .copyWith(color: Colors.grey),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                       SizedBox(
                  //                         height: 10,
                  //                       ),
                  //                       Obx(
                  //                         () => CiCBarChartByYear(
                  //                           barColor: Color(0xff0685CF),
                  //                           dataList: priceController
                  //                               .shareSubscriptionByYearDataList
                  //                               .toList(),
                  //                         ),
                  //                       ),
                  //                       SizedBox(
                  //                         height: 10,
                  //                       ),
                  //                       Divider(
                  //                         thickness: 1,
                  //                       ),
                  //                       Padding(
                  //                         padding: const EdgeInsets.symmetric(
                  //                             horizontal: 20),
                  //                         child: Column(
                  //                           mainAxisAlignment:
                  //                               MainAxisAlignment.start,
                  //                           crossAxisAlignment:
                  //                               CrossAxisAlignment.start,
                  //                           children: [
                  //                             Text(
                  //                               'UT Subscription By Price',
                  //                               style: Get.theme.brightness ==
                  //                                       Brightness.light
                  //                                   ? TextStyle(
                  //                                       color: Colors.grey[500],
                  //                                       fontFamily: 'DMSans')
                  //                                   : TextStyle(
                  //                                       color: Colors.white,
                  //                                       fontFamily: 'DMSans'),
                  //                             ),
                  //                             Text(
                  //                               'Figure in number of UT',
                  //                               style: Theme.of(context)
                  //                                   .textTheme
                  //                                   .bodyText1!
                  //                                   .copyWith(color: Colors.grey),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       ),
                  //                       SizedBox(
                  //                         height: 10,
                  //                       ),
                  //                       Obx(
                  //                         () => CiCBarChartByPrice(
                  //                           barColor: Color(0xff75BF72),
                  //                           dataList: priceController
                  //                               .shareSubscriptionByPriceDataList
                  //                               .toList(),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  // investment return information

                  // Container(
                  //   margin: EdgeInsets.symmetric(horizontal: 20),
                  //   decoration: boxExpansion,
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(10),
                  //     child: ClipRect(
                  //       child: BackdropFilter(
                  //         filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                  //         child: Container(
                  //           // decoration: boxExpansion,
                  //           decoration: boxExpansion,
                  //           child: Theme(
                  //             data: Theme.of(context).copyWith(
                  //                 cardColor: Colors.grey.shade50.withOpacity(1)),
                  //             child: ExpansionPanelList(
                  //               animationDuration: Duration(milliseconds: 100),
                  //               elevation: 0,
                  //               expansionCallback: (index, isExpand) {
                  //                 setState(() {
                  //                   isExpandInvestmentReturn =
                  //                       !isExpandInvestmentReturn;
                  //                 });
                  //               },
                  //               children: [
                  //                 ExpansionPanel(
                  //                     canTapOnHeader: true,
                  //                     isExpanded: isExpandInvestmentReturn,
                  //                     headerBuilder:
                  //                         (BuildContext context, bool isExpand) {
                  //                       return Padding(
                  //                         padding: const EdgeInsets.symmetric(
                  //                             horizontal: 20),
                  //                         child: Row(
                  //                           children: [
                  //                             SvgPicture.asset(
                  //                                 'assets/images/svgfile/investmentReturn.svg'),
                  //                             SizedBox(
                  //                               width: 10,
                  //                             ),
                  //                             Expanded(
                  //                               child: Text(
                  //                                   'Investment Return Information'),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                       );
                  //                     },
                  //                     body: Column(
                  //                       mainAxisAlignment: MainAxisAlignment.start,
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: [
                  //                         Padding(
                  //                           padding: const EdgeInsets.symmetric(
                  //                               horizontal: 20),
                  //                           child: Column(
                  //                             mainAxisAlignment:
                  //                                 MainAxisAlignment.start,
                  //                             crossAxisAlignment:
                  //                                 CrossAxisAlignment.start,
                  //                             children: [
                  //                               Text("Total Dividend Recieved"),
                  //                               Text('\$50,000'),
                  //                               SizedBox(
                  //                                 height: 10,
                  //                               ),
                  //                               Text("Last Year Dividend"),
                  //                               Text('\$5,800'),
                  //                               SizedBox(
                  //                                 height: 10,
                  //                               ),
                  //                               Row(
                  //                                 children: [
                  //                                   SvgPicture.asset(
                  //                                       'assets/images/svgfile/totalReturn.svg'),
                  //                                   SizedBox(
                  //                                     width: 10,
                  //                                   ),
                  //                                   Column(
                  //                                     mainAxisAlignment:
                  //                                         MainAxisAlignment.start,
                  //                                     crossAxisAlignment:
                  //                                         CrossAxisAlignment.start,
                  //                                     children: [
                  //                                       Text('Total Return'),
                  //                                       Text(
                  //                                         '\$64,440',
                  //                                         style: Theme.of(context)
                  //                                             .textTheme
                  //                                             .headline3,
                  //                                       ),
                  //                                     ],
                  //                                   ),
                  //                                 ],
                  //                               ),
                  //                               SizedBox(
                  //                                 width: 20,
                  //                               ),
                  //                               Text(
                  //                                 'Share Balance By Year',
                  //                                 style: DynamicTheme.of(context)
                  //                                             .brightness ==
                  //                                         Brightness.light
                  //                                     ? TextStyle(
                  //                                         color: Colors.grey[500],
                  //                                         fontFamily: 'DMSans')
                  //                                     : TextStyle(
                  //                                         color: Colors.white,
                  //                                         fontFamily: 'DMSans'),
                  //                               ),
                  //                               Text(
                  //                                 'Figure in number of share',
                  //                                 style: Theme.of(context)
                  //                                     .textTheme
                  //                                     .bodyText1
                  //                                     .copyWith(color: Colors.grey),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                         SizedBox(
                  //                           height: 10,
                  //                         ),
                  //                         Obx(
                  //                           () => CiCBarChartTradeByYear(
                  //                             barColor:
                  //                                 Theme.of(context).primaryColor,
                  //                             dataList: priceController
                  //                                 .shareSubscriptionTradeByYearDataList
                  //                                 .toList(),
                  //                           ),
                  //                         ),
                  //                         Container(
                  //                           decoration: BoxDecoration(
                  //                               color: Colors.white,
                  //                               boxShadow: [
                  //                                 BoxShadow(
                  //                                     offset: Offset(0.0, 0.0),
                  //                                     color: Colors.black12
                  //                                         .withAlpha(10),
                  //                                     blurRadius: 6)
                  //                               ],
                  //                               borderRadius:
                  //                                   BorderRadius.circular(10)),
                  //                           margin: EdgeInsets.all(20),
                  //                           padding: EdgeInsets.symmetric(
                  //                               horizontal: 20, vertical: 5),
                  //                           child: Row(children: [
                  //                             SvgPicture.asset(
                  //                                 'assets/images/svgfile/investmentRanking.svg'),
                  //                             SizedBox(
                  //                               width: 20,
                  //                             ),
                  //                             Column(
                  //                               mainAxisAlignment:
                  //                                   MainAxisAlignment.start,
                  //                               crossAxisAlignment:
                  //                                   CrossAxisAlignment.start,
                  //                               children: [
                  //                                 Text('Investment Ranking'),
                  //                                 Text(
                  //                                   'Your investment is in',
                  //                                   style: Theme.of(context)
                  //                                       .textTheme
                  //                                       .bodyText1,
                  //                                 ),
                  //                               ],
                  //                             ),
                  //                             Spacer(),
                  //                             AnimatedCircularChart(
                  //                               size: Size(60.0, 60.0),
                  //                               initialChartData: <
                  //                                   CircularStackEntry>[
                  //                                 CircularStackEntry(
                  //                                   <CircularSegmentEntry>[
                  //                                     CircularSegmentEntry(
                  //                                       10,
                  //                                       Theme.of(context)
                  //                                           .primaryColor,
                  //                                       rankKey: 'completed',
                  //                                     ),
                  //                                     CircularSegmentEntry(
                  //                                       90,
                  //                                       Colors.black12,
                  //                                       rankKey: 'remaining',
                  //                                     ),
                  //                                   ],
                  //                                   rankKey: 'progress',
                  //                                 ),
                  //                               ],
                  //                               chartType: CircularChartType.Radial,
                  //                               percentageValues: true,
                  //                               holeRadius: 11.0,
                  //                               holeLabel: '90%',
                  //                               labelStyle: TextStyle(
                  //                                 color: Colors.blueGrey[600],
                  //                                 fontWeight: FontWeight.bold,
                  //                                 fontSize: 10.0,
                  //                               ),
                  //                             )
                  //                           ]),
                  //                         ),
                  //                       ],
                  //                     )),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // ClipRect(
                  //   child: Container(
                  //     // child: Row(
                  //     //   children: [
                  //     //     SvgPicture.asset(
                  //     //         'assets/images/svgfile/shareSubscribe.svg'),
                  //     //     SizedBox(
                  //     //       width: 10,
                  //     //     ),
                  //     //     Text('Share Subscription'),
                  //     //   ],
                  //     // ),
                  //     child: Stack(
                  //       children: [
                  //         Container(
                  //           margin: EdgeInsets.all(20),
                  //           height: 100,
                  //           decoration: _boxDecoration,
                  //         ),
                  //         BackdropFilter(
                  //           filter: ImageFilter.blur(
                  //               sigmaX: 30.0, sigmaY: 30.0),
                  //           child: new Container(
                  //             margin: EdgeInsets.all(20),
                  //             height: 100,
                  //             decoration: new BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(10),
                  //                 border: Border.all(
                  //                     color: Colors.white, width: 2),
                  //                 color: Colors.grey.shade200
                  //                     .withOpacity(0.5)),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          )
        : DefaultSizeWeb(
            child: CupertinoScaffold(
              body: Builder(
                builder: (context) => CupertinoPageScaffold(
                  child: Scaffold(
                    appBar: CustomAppBar(
                      elevation: 0,
                      isLeading: true,
                      isLogo: false,
                      context: context,
                      title: "CiC Equity Fund",
                    ),
                    backgroundColor: AppColor.backgroundColor,
                    body: ConnectivityWidgetWrapper(
                      stacked: false,
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        children: [
                          const SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          SizedBox(
                            height: 130,
                            width: double.infinity,
                            child: SvgPicture.asset(
                              'assets/images/svgfile/Investment_backg.svg',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            top: 10.0,
                            left: 0.0,
                            right: 0.0,
                            bottom: 0.0,
                            child: RefreshIndicator(
                              key: refreshKey,
                              onRefresh: onRefresh,
                              child: Column(
                                // padding: const EdgeInsets.only(bottom: 20),
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          CustomCard(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/images/svgfile/shareInfo.svg',
                                                      ),
                                                      const SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        'UT Information',
                                                        key: _guidkey
                                                            .investmentKey[1]
                                                            .key = GlobalKey(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText2,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                            'Current UT Price',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'DMSans',
                                                                color: Colors
                                                                    .black54),
                                                          ),
                                                          Obx(
                                                            () => priceController
                                                                        .price
                                                                        .value
                                                                        .price !=
                                                                    null
                                                                ? Text(
                                                                    priceController
                                                                        .price
                                                                        .value
                                                                        .price!,
                                                                    // '\$${f.format(3022.23)}',

                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            22,
                                                                        fontFamily:
                                                                            'DMSans',
                                                                        color: Colors
                                                                            .black),
                                                                  )
                                                                : Container(),
                                                          ),
                                                        ],
                                                      ),
                                                      GestureDetector(
                                                        onTap: () async {
                                                          debugPrint(
                                                              "Certification:${priceController.certificate.value.data}");
                                                          // context.push(
                                                          // '/investment/cic-equity-fund/certificate??title=Something&urlAttachment=${priceController.certificate.value.data}');

                                                          await Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => PDFViewer(
                                                                  title:
                                                                      "Something",
                                                                  urlAttachment:
                                                                      priceController
                                                                          .certificate
                                                                          .value
                                                                          .data),
                                                            ),
                                                          );
                                                        },
                                                        child: Container(
                                                          key: _guidkey
                                                              .investmentKey[2]
                                                              .key = GlobalKey(),
                                                          alignment:
                                                              Alignment.center,
                                                          height: 40.0,
                                                          width: 40.0,
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor
                                                                  .withAlpha(
                                                                      16)),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/svgfile/pdfcertificate.svg',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SvgPicture.asset(
                                                                'assets/images/svgfile/totalShare.svg'),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Total UT',
                                                                  style: Get.theme
                                                                              .brightness ==
                                                                          Brightness
                                                                              .light
                                                                      ? TextStyle(
                                                                          color: Colors.grey[
                                                                              500],
                                                                          fontFamily:
                                                                              'DMSans')
                                                                      : const TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontFamily:
                                                                              'DMSans'),
                                                                ),
                                                                Obx(
                                                                  () => Text(
                                                                    priceController.sharePrice.value.totalShareOutstanding !=
                                                                                null &&
                                                                            priceController.sharePrice.value.totalShareOutstanding !=
                                                                                0
                                                                        ? n.format(priceController
                                                                            .sharePrice
                                                                            .value
                                                                            .totalShareOutstanding)
                                                                        : '0.0',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .headline3,
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SvgPicture.asset(
                                                          "assets/images/svgfile/investdivider.svg"),
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            const SizedBox(
                                                                width: 20.0),
                                                            SvgPicture.asset(
                                                                'assets/images/svgfile/totalNetworth.svg'),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Total UT Price',
                                                                  style: Get.theme
                                                                              .brightness ==
                                                                          Brightness
                                                                              .light
                                                                      ? TextStyle(
                                                                          color: Colors.grey[
                                                                              500],
                                                                          fontFamily:
                                                                              'DMSans')
                                                                      : const TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontFamily:
                                                                              'DMSans'),
                                                                ),
                                                                Obx(
                                                                  () => Text(
                                                                    priceController.sharePrice.value.totalNetWorth !=
                                                                                null &&
                                                                            priceController.sharePrice.value.totalNetWorth !=
                                                                                0
                                                                        ? '\$${f.format(priceController.sharePrice.value.totalNetWorth)}'
                                                                        : '\$0.0',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .headline3,
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                //   share price chart

                                                ClipRect(
                                                  child: SizedBox(
                                                    height: 250,
                                                    child: Stack(
                                                      children: [
                                                        const SizedBox(
                                                          height:
                                                              double.infinity,
                                                          width:
                                                              double.infinity,
                                                        ),
                                                        Positioned(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'UT Price Evolution',
                                                                      key: _guidkey
                                                                          .investmentKey[
                                                                              3]
                                                                          .key = GlobalKey(),
                                                                      style: Get.theme.brightness ==
                                                                              Brightness
                                                                                  .light
                                                                          ? TextStyle(
                                                                              color: Colors.grey[
                                                                                  500],
                                                                              fontFamily:
                                                                                  'DMSans')
                                                                          : const TextStyle(
                                                                              color: Colors.white,
                                                                              fontFamily: 'DMSans'),
                                                                    ),
                                                                    Text(
                                                                      'Figure in USD',
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodyText1!
                                                                          .copyWith(
                                                                              color: Colors.grey),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Obx(
                                                          () => priceController
                                                                  .isLoading
                                                                  .value
                                                              ? Center(
                                                                  child:
                                                                      Container(),
                                                                )
                                                              : priceController
                                                                          .sharePrice
                                                                          .value
                                                                          .evolution !=
                                                                      null
                                                                  ? Positioned(
                                                                      top: 50,
                                                                      left: 5,
                                                                      right: 5,
                                                                      bottom: 0,
                                                                      child: CiCLineChart(
                                                                          dataList: priceController
                                                                              .sharePrice
                                                                              .value
                                                                              .evolution!
                                                                              .reversed
                                                                              .toList()),
                                                                    )
                                                                  : Positioned(
                                                                      top: 50,
                                                                      left: 5,
                                                                      right: 5,
                                                                      bottom: 0,
                                                                      child: CiCLineChart(
                                                                          dataList:
                                                                              reversList),
                                                                    ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Obx(
                                            () => priceController
                                                    .investDataList.isNotEmpty
                                                ? const SizedBox(
                                                    height: 20,
                                                  )
                                                : Container(),
                                          ),
                                          // Chhany
                                          Obx(
                                            () => priceController
                                                    .isInvestLoading.value
                                                ? Center(
                                                    child: Container(),
                                                  )
                                                : priceController.investDataList
                                                        .isNotEmpty
                                                    ? ReturnOnInvestment(
                                                        yearsList:
                                                            priceController
                                                                .investDataList,
                                                      )
                                                    : Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SafeArea(
                                    top: false,
                                    minimum: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 20,
                                    ),
                                    child: CustomButton(
                                      isOutline: false,
                                      isDisable: false,
                                      onPressed: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         const SubscribeBonusScreen(),
                                        //   ),
                                        // );
                                        context.push(
                                            "/wallet/invest-fif/cic-equity-fund/ut-subscription/new-subscription");
                                      },
                                      title: "Invest More",
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
