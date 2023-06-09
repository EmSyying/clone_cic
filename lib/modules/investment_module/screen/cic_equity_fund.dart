import 'dart:async';

import 'package:cicgreenloan/Utils/helper/local_storage.dart';
import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:cicgreenloan/modules/investment_module/model/share_price_model.dart';

import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/modules/investment_module/screen/certificate.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../Utils/chart/line_chart.dart';
import '../../../Utils/function/format_date_time.dart';
import '../../../Utils/helper/color.dart';
import '../../../Utils/helper/custom_appbar.dart';
import '../../../utils/form_builder/custom_button.dart';
import '../../../utils/helper/cic/cic_guider.dart';
import '../../../widgets/defualt_size_web.dart';
import '../../../widgets/investments/custom_card.dart';
import '../../../widgets/investments/equity_fund/subscription_chart.dart';
import '../../../widgets/investments/equity_fund/trading_chart.dart';
import '../../../widgets/investments/return_on_investment.dart';
import '../../guilder/guider_controller.dart';

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
    priceController.onFetchPrice();
    priceController.getSharePrice().then((value) {
      if (value.evolutionAfter != null && value.evolutionAfter!.isNotEmpty) {
        Future.delayed(const Duration(milliseconds: 500), () async {
          int time = 0;
          time = await LocalStorage.getIntValue(key: 'showTwoTime');
          if (time < 2) {
            time = time + 1;
            await LocalStorage.storeData(key: 'showTwoTime', value: time);
            _guidkey.showShareSplit(context);
          }
          debugPrint("--------------$time");
        });
      }
    });
    priceController.fetchCertificate();
    priceController.fetchOnReturnInvestment();
    priceController.getShareSubHistories();
    priceController.isFromWallet.value = false;
    priceController.getAllChartList();

    super.initState();
  }

  int selectedSegment = 0;
  bool hide = false;
  final List<Widget> utChartHistory = [
    const SubscriptionChart(),
    const TradingChart(),
  ];
  final String datetime = DateTime.now().toString();
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
                    Expanded(
                      child: SingleChildScrollView(
                        controller: priceController.cicEquityScroll,
                        child: Column(
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/svgfile/shareInfo.svg',
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'UT Information',
                                          key: priceController
                                                  .allowFeaturebyTag.value
                                              ? _guidkey.investmentKey[1].key =
                                                  GlobalKey()
                                              : _guidkey.investmentKeyNoFiF[0]
                                                  .key = GlobalKey(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                              () => priceController
                                                          .price.value.price !=
                                                      null
                                                  ? Row(
                                                      children: [
                                                        Text(
                                                          priceController.price
                                                              .value.price!,
                                                          // '\$${f.format(3022.23)}',

                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 22,
                                                                  fontFamily:
                                                                      'DMSans',
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10.0),
                                                          child: Text(
                                                            "As of ${FormatDate.investmentDateDisplayUTPrice(datetime)}",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .displayMedium!
                                                                .copyWith(
                                                                  fontSize: 10,
                                                                  color: const Color(
                                                                      0XFF464646),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  : Container(),
                                            ),
                                          ],
                                        ),
                                        if (priceController.sharePrice.value
                                                    .totalShareOutstanding !=
                                                0 &&
                                            priceController.sharePrice.value
                                                    .totalShareOutstanding !=
                                                null)
                                          GestureDetector(
                                            onTap: () async {
                                              debugPrint(
                                                  "Certification:${priceController.certificate.value.data}");
                                              context.go(
                                                  '/investment/cic-equity-fund/certificate');
                                            },
                                            child: Container(
                                              key: priceController
                                                      .allowFeaturebyTag.value
                                                  ? _guidkey.investmentKey[2]
                                                      .key = GlobalKey()
                                                  : _guidkey
                                                      .investmentKeyNoFiF[1]
                                                      .key = GlobalKey(),
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
                                  if (priceController.sharePrice.value
                                              .totalShareOutstanding !=
                                          0 &&
                                      priceController.sharePrice.value
                                              .totalShareOutstanding !=
                                          null)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Row(
                                              key: _guidkey.shareSplit.key =
                                                  GlobalKey(),
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/svgfile/totalShare.svg',
                                                    color: Theme.of(context)
                                                        .primaryColor),
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
                                                      style: Get.theme
                                                                  .brightness ==
                                                              Brightness.light
                                                          ? TextStyle(
                                                              color: Colors
                                                                  .grey[500],
                                                              fontFamily:
                                                                  'DMSans')
                                                          : const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  'DMSans'),
                                                    ),
                                                    Obx(
                                                      () => Text(
                                                        priceController
                                                                        .sharePrice
                                                                        .value
                                                                        .totalShareOutstanding !=
                                                                    0 &&
                                                                priceController
                                                                        .sharePrice
                                                                        .value
                                                                        .totalShareOutstanding !=
                                                                    null
                                                            ? n.format(
                                                                priceController
                                                                    .sharePrice
                                                                    .value
                                                                    .totalShareOutstanding)
                                                            : '0.0',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displaySmall,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          SvgPicture.asset(
                                            "assets/images/svgfile/investdivider.svg",
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(width: 20.0),
                                                SvgPicture.asset(
                                                  'assets/images/svgfile/totalNetworth.svg',
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
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
                                                      style: Get.theme
                                                                  .brightness ==
                                                              Brightness.light
                                                          ? TextStyle(
                                                              color: Colors
                                                                  .grey[500],
                                                              fontFamily:
                                                                  'DMSans')
                                                          : const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  'DMSans'),
                                                    ),
                                                    Obx(
                                                      () => Text(
                                                        priceController
                                                                        .sharePrice
                                                                        .value
                                                                        .totalNetWorth !=
                                                                    0 &&
                                                                priceController
                                                                        .sharePrice
                                                                        .value
                                                                        .totalNetWorth !=
                                                                    null
                                                            ? '\$${f.format(priceController.sharePrice.value.totalNetWorth)}'
                                                            : '\$0.0',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displaySmall,
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
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'UT Price Evolution',
                                                        key: priceController
                                                                .allowFeaturebyTag
                                                                .value
                                                            ? _guidkey
                                                                    .investmentKey[
                                                                        3]
                                                                    .key =
                                                                GlobalKey()
                                                            : _guidkey
                                                                .investmentKeyNoFiF[
                                                                    2]
                                                                .key = GlobalKey(),
                                                        style: Get.theme
                                                                    .brightness ==
                                                                Brightness.light
                                                            ? TextStyle(
                                                                color: Colors
                                                                    .grey[500],
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
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge!
                                                            .copyWith(
                                                                color: Colors
                                                                    .grey),
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
                                                    .isLoadingSharePrice.value
                                                ? Center(
                                                    child: Container(),
                                                  )
                                                : priceController.sharePrice
                                                            .value.evolution !=
                                                        null
                                                    ? Positioned(
                                                        top: 50,
                                                        left: 5,
                                                        right: 5,
                                                        bottom: 0,
                                                        child: CiCLineChart(
                                                          dataList:
                                                              priceController
                                                                  .sharePrice
                                                                  .value
                                                                  .evolution!
                                                                  .reversed
                                                                  .toList(),
                                                          dataAfterSplit:
                                                              priceController
                                                                  .sharePrice
                                                                  .value
                                                                  .evolutionAfter!
                                                        ),
                                                      )
                                                    : Positioned(
                                                        top: 50,
                                                        left: 5,
                                                        right: 5,
                                                        bottom: 0,
                                                        child: CiCLineChart(
                                                            dataList:
                                                                reversList,dataAfterSplit: priceController
                                                                        .sharePrice
                                                                        .value
                                                                        .evolutionAfter!),
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
                                          yearsList:
                                              priceController.investDataList,
                                        )
                                      : Container(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!priceController.isLoadingSharePrice.value)
                      SafeArea(
                        top: false,
                        minimum: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                isOutline: true,
                                isDisable: false,
                                onPressed: () {
                                  // context.push(
                                  //     '/investment/fixed-income-fund/about-fif?title=About EF&url=https://www.canva.com/design/DAFWwsIRwcY/9WlLie_SZi0dX4dbZOsazQ/view?website#4');
                                  context.go(
                                      '/ut-subscription/histories-subscription?fromPage=investment');
                                },
                                title: "UT Payment",
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            Expanded(
                              child: CustomButton(
                                isOutline: false,
                                isDisable: false,
                                onPressed: () {
                                  context.push(
                                      "/ut-subscription/new-subscription?fromPage=investment");
                                },
                                title: "Subscribe Now",
                              ),
                            ),
                          ],
                        ),
                      ),
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
                        action: [
                          GestureDetector(
                            onTap: () async {
                              await CiCApp.showOverlays(
                                context: context,
                                key: (_) => _guidkey.investmentKeyNoFiF[_].key!,
                                objectSettingBuilder: (_) => ObjectSetting(
                                    edgeInsets: _ == 0 || _ == 4
                                        ? const EdgeInsets.symmetric(
                                            horizontal: 10)
                                        : const EdgeInsets.all(10),
                                    radius: _ == 1
                                        ? BorderRadius.circular(50)
                                        : null,
                                    paddingSize: _ == 0
                                        ? const Size(0, 0)
                                        : _ == 2
                                            ? const Size(0, -10)
                                            : null),
                                titleBuilder: (_) =>
                                    _guidkey.investmentKeyNoFiF[_].title ?? '',
                                descriptionBuilder: (_) =>
                                    _guidkey
                                        .investmentKeyNoFiF[_].description ??
                                    '',
                                itemCount: _guidkey.investmentKeyNoFiF.length,
                                allowSkip: true,
                                overlaySetting: OverlaySetting(),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: SvgPicture.asset(
                                'assets/images/demo.svg',
                              ),
                            ),
                          )
                        ]),
                    backgroundColor: AppColor.backgroundColor,
                    body: Stack(
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
                                                        .investmentKeyNoFiF[0]
                                                        .key = GlobalKey(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium,
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
                                                            ? Row(
                                                                children: [
                                                                  Text(
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
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10.0),
                                                                    child: Text(
                                                                      "As of ${FormatDate.investmentDateDisplayUTPrice(datetime)}",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .displayMedium!
                                                                          .copyWith(
                                                                            fontSize:
                                                                                10,
                                                                            color:
                                                                                const Color(0XFF464646),
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                            : Container(),
                                                      ),
                                                    ],
                                                  ),
                                                  if (priceController
                                                              .sharePrice
                                                              .value
                                                              .totalShareOutstanding !=
                                                          0 &&
                                                      priceController
                                                              .sharePrice
                                                              .value
                                                              .totalShareOutstanding !=
                                                          null)
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
                                                            .investmentKeyNoFiF[
                                                                1]
                                                            .key = GlobalKey(),
                                                        alignment:
                                                            Alignment.center,
                                                        height: 40.0,
                                                        width: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor
                                                                    .withAlpha(
                                                                        16)),
                                                        child: SvgPicture.asset(
                                                          'assets/images/svgfile/pdfcertificate.svg',
                                                          color:
                                                              Theme.of(context)
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
                                            if (priceController.sharePrice.value
                                                        .totalShareOutstanding !=
                                                    0 &&
                                                priceController.sharePrice.value
                                                        .totalShareOutstanding !=
                                                    null)
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
                                                        key: _guidkey.shareSplit
                                                            .key = GlobalKey(),
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
                                                                              0 &&
                                                                          priceController.sharePrice.value.totalShareOutstanding !=
                                                                              null
                                                                      ? n.format(priceController
                                                                          .sharePrice
                                                                          .value
                                                                          .totalShareOutstanding)
                                                                      : '0.0',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .displaySmall,
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
                                                                              0 &&
                                                                          priceController.sharePrice.value.totalNetWorth !=
                                                                              null
                                                                      ? '\$${f.format(priceController.sharePrice.value.totalNetWorth)}'
                                                                      : '\$0.0',
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .displaySmall,
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
                                                                          .investmentKeyNoFiF[
                                                                              2]
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
                                                                      .bodyLarge!
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
                                                                  child:
                                                                      CiCLineChart(
                                                                    dataList: priceController
                                                                        .sharePrice
                                                                        .value
                                                                        .evolution!
                                                                        .reversed
                                                                        .toList(),
                                                                        dataAfterSplit: priceController
                                                                        .sharePrice
                                                                        .value
                                                                        .evolutionAfter!,
                                                                  ),
                                                                )
                                                              : Positioned(
                                                                  top: 50,
                                                                  left: 5,
                                                                  right: 5,
                                                                  bottom: 0,
                                                                  child: CiCLineChart(
                                                                      dataList:
                                                                          reversList,dataAfterSplit: priceController
                                                                        .sharePrice
                                                                        .value
                                                                        .evolutionAfter!),
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
                                )),
                                if (!priceController.isLoadingSharePrice.value)
                                  SafeArea(
                                    top: false,
                                    minimum: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 20,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CustomButton(
                                            isOutline: true,
                                            isDisable: false,
                                            onPressed: () {
                                              // context.push(
                                              //     '/investment/fixed-income-fund/about-fif?title=About EF&url=https://www.canva.com/design/DAFWwsIRwcY/9WlLie_SZi0dX4dbZOsazQ/view?website#4');
                                              context.push(
                                                  "/wallet/invest-fif/cic-equity-fund/ut-subscription/histories-subscription");
                                            },
                                            title: "UT Payment",
                                          ),
                                        ),
                                        const SizedBox(width: 20.0),
                                        Expanded(
                                          child: CustomButton(
                                            isOutline: false,
                                            isDisable: false,
                                            onPressed: () {
                                              context.push(
                                                  "/wallet/invest-fif/cic-equity-fund/ut-subscription/new-subscription");
                                            },
                                            title: "Subscribe Now",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                // SafeArea(
                                //   top: false,
                                //   minimum: const EdgeInsets.symmetric(
                                //     horizontal: 20,
                                //     vertical: 20,
                                //   ),
                                //   child: CustomButton(
                                //     isOutline: false,
                                //     isDisable: false,
                                //     onPressed: () {
                                // context.push(
                                //     "/wallet/invest-fif/cic-equity-fund/ut-subscription/new-subscription");
                                //     },
                                //     title: "Subscribe Now",
                                //   ),
                                // )
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
          );
  }
}
