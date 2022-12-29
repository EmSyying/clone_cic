import 'dart:async';

import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/configs/route_configuration/route.dart';
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
import '../../wallet/controller/wallet_controller.dart';
import 'investment_empty_state_screen.dart';

class CiCEquityFund extends StatefulWidget {
  final bool? isNavigator;
  final bool isEquityTrue;
  final String? tabName;
  const CiCEquityFund(
      {Key? key, this.isEquityTrue = false, this.isNavigator, this.tabName})
      : super(key: key);

  @override
  State<CiCEquityFund> createState() => _CiCEquityFundState();
}

class _CiCEquityFundState extends State<CiCEquityFund> {
  final priceController = Get.put(PriceController());
  final bonusCon = Get.put(BonusController());
  final _walletController = Get.put(WalletController());
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
    bonusCon.fetchUTScription();
    bonusCon.fetchPaymentSummary();
    bonusCon.fetchbonusSetting();
    _walletController.fetchWalletAmount();
    priceController.fetchCertificate();
    priceController.fetchOnReturnInvestment();
    priceController.getShareSubHistories();
    priceController.isFromWallet.value = false;
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
              child: Obx(
                () => Column(
                  // padding: const EdgeInsets.only(bottom: 20),
                  children: [
                    priceController.isLoadingSharePrice.value
                        ? const LinearProgressIndicator()
                        : priceController.sharePrice.value
                                        .totalShareOutstanding !=
                                    null &&
                                priceController.sharePrice.value
                                        .totalShareOutstanding !=
                                    0
                            ? Expanded(
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/images/svgfile/shareInfo.svg',
                                                    color: Theme.of(context)
                                                        .primaryColor,
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'Current UT Price',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'DMSans',
                                                            color:
                                                                Colors.black54),
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
                                                      context.go(
                                                          '/investment/cic-equity-fund/certificate');
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
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColor
                                                              .withAlpha(16)),
                                                      child: SvgPicture.asset(
                                                        'assets/images/svgfile/pdfcertificate.svg',
                                                        color: Theme.of(context)
                                                            .primaryColor,
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
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                            'assets/images/svgfile/totalShare.svg',
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
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
                                                    "assets/images/svgfile/investdivider.svg",
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
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
                                                          'assets/images/svgfile/totalNetworth.svg',
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                        ),
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
                                                      height: double.infinity,
                                                      width: double.infinity,
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
                                                            padding:
                                                                const EdgeInsets
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
                                                                          .key =
                                                                      GlobalKey(),
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
                                                                Text(
                                                                  'Figure in USD',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodyText1!
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.grey),
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
                                                              .isLoadingSharePrice
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
                                            : priceController
                                                    .investDataList.isNotEmpty
                                                ? ReturnOnInvestment(
                                                    yearsList: priceController
                                                        .investDataList,
                                                  )
                                                : Container(),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : const Expanded(
                                child: IvestmentEmptyStateScreen(
                                  isFixedIncom: false,
                                ),
                              ),
                    if (!priceController.isLoadingSharePrice.value)
                      SafeArea(
                        top: false,
                        minimum: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Obx(
                          () => userCon.isloading.value
                              ? CustomButton(
                                  isOutline: false,
                                  isDisable: true,
                                  onPressed: () {
                                    context.push(
                                        "/ut-subscription/new-subscription?fromPage=investment");
                                  },
                                  title: "Subscribe Now",
                                )
                              : CustomButton(
                                  isOutline: false,
                                  isDisable: false,
                                  onPressed: () {
                                    context.push(
                                        "/ut-subscription/new-subscription?fromPage=investment");
                                  },
                                  title: "Subscribe Now",
                                ),
                        ),
                      )
                  ],
                ),
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
                          if (!priceController.isLoadingSharePrice.value)
                            SizedBox(
                              height: 130,
                              width: double.infinity,
                              child: SvgPicture.asset(
                                'assets/images/svgfile/Investment_backg.svg',
                                color: Theme.of(context).primaryColor,
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
                                                        color: Theme.of(context)
                                                            .primaryColor,
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
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
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
                                                                'assets/images/svgfile/totalShare.svg',
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor),
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
                                                        "assets/images/svgfile/investdivider.svg",
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),
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
                                                              'assets/images/svgfile/totalNetworth.svg',
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                            ),
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
                                                                  .isLoadingSharePrice
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
                                        context.push(
                                            "/wallet/invest-fif/cic-equity-fund/ut-subscription/new-subscription");
                                      },
                                      title: "Subscribe Now",
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
