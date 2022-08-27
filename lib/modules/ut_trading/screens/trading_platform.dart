import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/modules/ut_trading/screens/cancel_trade.dart';
import 'package:cicgreenloan/modules/ut_trading/screens/match_trade.dart';
import 'package:cicgreenloan/modules/ut_trading/screens/trading_instruction.dart';
import 'package:cicgreenloan/modules/ut_trading/screens/un_match_trade.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../Utils/function/format_date_time.dart';
import '../../../utils/form_builder/custom_material_modal_sheet.dart';
import '../../../utils/helper/container_partern.dart';
import '../../../utils/helper/custom_appbar.dart';
import '../../../utils/helper/firebase_analytics.dart';
import '../../../widgets/ut_tradding/custom_buy_card.dart';
import '../../../widgets/ut_tradding/custom_fun_card.dart';
import '../../../widgets/ut_tradding/custom_last_trading_info.dart';
import '../../../widgets/ut_tradding/custom_max_min_card.dart';
import '../../../widgets/ut_tradding/maximum_shimmer_card.dart';
import '../../../widgets/ut_tradding/trade_session_shimmer.dart';
import '../../../widgets/ut_tradding/trading_session_card.dart';
import '../../member_directory/controllers/customer_controller.dart';
import '../../member_directory/controllers/member_controller.dart';
import '../../member_directory/models/member.dart';
import '../controllers/trading_controller.dart';

class UTtrading extends StatefulWidget {
  final int? tradeId;
  const UTtrading({Key? key, this.tradeId}) : super(key: key);

  @override
  State<UTtrading> createState() => _UTtradingState();
}

class _UTtradingState extends State<UTtrading>
    with SingleTickerProviderStateMixin {
  final inquiryController = Get.put(InquiryController());
  final constomerController = Get.put(CustomerController());
  final memberController = Get.put(MemberController());

  @override
  void initState() {
    inquiryController.tabController = TabController(length: 3, vsync: this);

    inquiryController.getTradingSetting();
    inquiryController.fetchLastTradingOption();

    inquiryController.getSharePrice();
    inquiryController.getInquiryListAll(
        constomerController.customer.value.customerId.toString());
    Future.delayed(const Duration(seconds: 6), () {
      inquiryController.fetchLastTradingDetail(
          id: inquiryController.lastTradingOptionModelList[0].id);
    });

    super.initState();
  }

  double get randHeight => Random().nextInt(100).toDouble();

  // Children with random heights - You can build your widgets of unknown heights here
  // I'm just passing the context in case if any widgets built here needs  access to context based data like Theme or MediaQuery

  int currentIndex = 1;
  DateTime now = DateTime.now();
  final cusController = Get.put(CustomerController());
  List<EquiryModelTest> listEquirystatic = [
    EquiryModelTest(totalProce: 200, totalUT: 10),
    EquiryModelTest(totalProce: 150, totalUT: 20),
    EquiryModelTest(totalProce: 100, totalUT: 30),
  ];

  bool? isOpenMarket() {
    if (inquiryController.tradingSettingData.data!.market!.open!) {
      DateTime date = DateTime.parse(
          inquiryController.tradingSettingData.data!.market!.endDate!);
      if (DateTime.now().isBefore(date)) {
        return inquiryController.tradingSettingData.data!.market!.open!;
      }
    }
    return null;
  }

  // String? getFormatedDate(_date) {
  //   var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  //   var inputDate = inputFormat.parse(_date);
  //   var outputFormat = DateFormat('EEEE, dd MMM yyyy');
  //   return outputFormat.format(inputDate);
  // }

  Future<void> onRefresh() async {
    inquiryController.tabController.index == 2
        ? inquiryController.getInquiryList(
            'cancelled',
            '',
            constomerController.customer.value.customerId.toString(),
          )
        : inquiryController.tabController.index == 1
            ? inquiryController.getInquiryList(
                'upsuccess',
                '',
                constomerController.customer.value.customerId.toString(),
              )
            : inquiryController.getInquiryList(
                'success',
                '',
                constomerController.customer.value.customerId.toString(),
              );
    inquiryController.getTradingSetting();
    inquiryController.getSharePrice();
    inquiryController.getInquiryListAll(
        constomerController.customer.value.customerId.toString());
  }

  final refreshkey = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    debugPrint("Full Route: ${router.location}");

    return CupertinoScaffold(
      body: Builder(builder: (BuildContext context) {
        if (widget.tradeId != null) {
          Future.delayed(const Duration(seconds: 2), () async {
            await onShowCustomCupertinoModalSheet(
                context: context,
                child: const Text("Hello Center"),
                title: 'Title');
          });
        }
        return CupertinoPageScaffold(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Stack(
                  children: [
                    CustomPaint(
                      size: Size(double.infinity,
                          MediaQuery.of(context).size.height * 1),
                      painter: RPSCustomPainter(),
                    ),
                    Positioned(
                      top: 100.0,
                      left: 0.0,
                      right: 0.0,
                      bottom: 0.0,
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: Get.height,
                          child: DefaultTabController(
                              length: 3,
                              child: RefreshIndicator(
                                notificationPredicate: (notification) {
                                  // with NestedScrollView local(depth == 2) OverscrollNotification are not sent
                                  if (notification is OverscrollNotification ||
                                      Platform.isIOS) {
                                    return notification.depth == 2;
                                  }
                                  return notification.depth == 0;
                                },
                                onRefresh: onRefresh,
                                key: refreshkey,
                                child: NestedScrollView(
                                  body: Container(
                                    color: Colors.white,
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TabBar(
                                          tabs: const [
                                            Tab(
                                              child: Text('Matched'),
                                            ),
                                            Tab(
                                              child: Text('Unmatched'),
                                            ),
                                            Tab(
                                              child: Text('Canceled'),
                                            ),
                                          ],
                                          controller:
                                              inquiryController.tabController,
                                          onTap: (int i) {
                                            if (i == 0) {
                                              FirebaseAnalyticsHelper
                                                  .sendAnalyticsEvent(
                                                      "Mathced Trading Tab");
                                            } else if (i == 1) {
                                              FirebaseAnalyticsHelper
                                                  .sendAnalyticsEvent(
                                                      "Unmatched Trading Tab");
                                            } else {
                                              FirebaseAnalyticsHelper
                                                  .sendAnalyticsEvent(
                                                      "Canceled Trading Tab");
                                            }
                                          },
                                          indicatorSize:
                                              TabBarIndicatorSize.label,
                                          isScrollable: false,
                                          labelStyle: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 14,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                          indicatorWeight: 3,
                                          indicatorColor:
                                              Theme.of(context).primaryColor,
                                          labelColor:
                                              Theme.of(context).primaryColor,
                                          unselectedLabelColor:
                                              Get.theme.brightness ==
                                                      Brightness.light
                                                  ? Colors.grey[500]
                                                  : Colors.white,
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5),
                                            child: TabBarView(
                                              controller: inquiryController
                                                  .tabController,
                                              children: const [
                                                MatchTrade(),
                                                UnMatchTrade(),
                                                CancelTrade(),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  headerSliverBuilder: (context, _) {
                                    return [
                                      Obx(
                                        () => SliverList(
                                          delegate: SliverChildListDelegate(
                                            [
                                              !inquiryController.isLoadingMarket
                                                          .value &&
                                                      inquiryController
                                                              .tradingSettingData
                                                              .data!
                                                              .market!
                                                              .open !=
                                                          true
                                                  ? Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20.0,
                                                              right: 20.0),
                                                      child: const Text(
                                                        'If you already have a buyer/seller to trade with, you can transact now. Otherwise please wait until trading session is opended',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white70),
                                                      ),
                                                    )
                                                  : Container(),
                                              const SizedBox(height: 20.0),
                                              inquiryController
                                                      .isLoadingMarket.value
                                                  ? const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 20, right: 20),
                                                      child:
                                                          TradingSessionShimmerCard(),
                                                    )
                                                  : Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20,
                                                              right: 20),
                                                      child: TradingSessionCard(
                                                        onTap: () async {
                                                          FirebaseAnalyticsHelper
                                                              .sendAnalyticsEvent(
                                                                  "View Last Trading Information");
                                                          inquiryController
                                                              .isSelect
                                                              .value = true;
                                                          inquiryController
                                                              .lastTradinInfoIndex
                                                              .value = 0;
                                                          Future.delayed(
                                                              const Duration(
                                                                  seconds: 3),
                                                              () {
                                                            inquiryController
                                                                .fetchLastTradingDetail(
                                                                    id: inquiryController
                                                                        .lastTradingOptionModelList[
                                                                            0]
                                                                        .id);
                                                          });
                                                          showMaterialModalBottomSheet(
                                                            shape: const RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            borderRaduis),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            borderRaduis))),
                                                            context: context,
                                                            builder: (context) =>
                                                                customAlertLastTradingInfo(
                                                              tradingOptionList:
                                                                  inquiryController
                                                                      .lastTradingOptionModelList,
                                                              context: context,
                                                              title:
                                                                  'Last Trading Info',
                                                              icon: Icons.close,
                                                            ),
                                                          );
                                                          inquiryController
                                                              .isInitSelct
                                                              .value = true;
                                                          inquiryController
                                                              .isLoadingCard
                                                              .value = true;

                                                          inquiryController
                                                              .update();
                                                        },
                                                        tradingstartDate: inquiryController
                                                                    .tradingSettingData
                                                                    .data!
                                                                    .market!
                                                                    .startDate! !=
                                                                ""
                                                            ? FormatDate.formatDateTime(
                                                                inquiryController
                                                                    .tradingSettingData
                                                                    .data!
                                                                    .market!
                                                                    .startDate!)
                                                            : inquiryController
                                                                .tradingSettingData
                                                                .data!
                                                                .market!
                                                                .startDate,
                                                        tradingendDate: inquiryController
                                                                        .tradingSettingData
                                                                        .data!
                                                                        .market!
                                                                        .fromTime !=
                                                                    "" &&
                                                                inquiryController
                                                                        .tradingSettingData
                                                                        .data!
                                                                        .market!
                                                                        .toTime !=
                                                                    ""
                                                            ? '${inquiryController.tradingSettingData.data!.market!.fromTime} - ${inquiryController.tradingSettingData.data!.market!.toTime}'
                                                            : inquiryController
                                                                .tradingSettingData
                                                                .data!
                                                                .market!
                                                                .fromTime,
                                                        openMarket:
                                                            inquiryController
                                                                .tradingSettingData
                                                                .data!
                                                                .market!
                                                                .open,
                                                      ),
                                                    ),
                                              const SizedBox(height: 20.0),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 20, right: 20),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    inquiryController
                                                            .isLoadingMarket
                                                            .value
                                                        ? const CustomMaximumShimmer()
                                                        : CustomMaxMinCard(
                                                            isLoading:
                                                                inquiryController
                                                                    .isLoadingMarket
                                                                    .value,
                                                            isOpen: inquiryController
                                                                .tradingSettingData
                                                                .data!
                                                                .market!
                                                                .open!,
                                                            maximum: inquiryController
                                                                .tradingSettingData
                                                                .data!
                                                                .market!
                                                                .maxBasePrice!
                                                                .toString(),
                                                            minimum: inquiryController
                                                                .tradingSettingData
                                                                .data!
                                                                .market!
                                                                .minBasePrice!
                                                                .toString(),
                                                            base: inquiryController
                                                                .tradingSettingData
                                                                .data!
                                                                .market!
                                                                .basePrice!
                                                                .toString(),
                                                          ),
                                                    if (!inquiryController
                                                        .isLoadingInquiry.value)
                                                      CustomBuyCard(
                                                        title: 'All',
                                                        listData: inquiryController
                                                            .listInquiryallData
                                                            .toList(),
                                                      ),
                                                    const Text(
                                                      'Available Funds to Trade',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                    const SizedBox(
                                                        height: 20.0),
                                                    CustomFunCard(
                                                      isLoading:
                                                          inquiryController
                                                              .isLoadingInquiry
                                                              .value,
                                                      utPrice: inquiryController
                                                          .sharePrice
                                                          .value
                                                          .totalUt,
                                                      totalPrice:
                                                          inquiryController
                                                              .sharePrice
                                                              .value
                                                              .totalPrice,
                                                      onBuy: () async {
                                                        FirebaseAnalyticsHelper
                                                            .sendAnalyticsEvent(
                                                                "Buy Trade");
                                                        memberController
                                                            .selectedMember
                                                            .value = Member();

                                                        context.go(
                                                            '/ut-trading/trading-inquiry/buy');
                                                      },
                                                      onSale: () {
                                                        FirebaseAnalyticsHelper
                                                            .sendAnalyticsEvent(
                                                                "Sell Trade");
                                                        memberController
                                                            .selectedMember
                                                            .value = Member();

                                                        context.go(
                                                            '/ut-trading/trading-inquiry/sell');
                                                      },
                                                    ),
                                                    const SizedBox(
                                                        height: 15.0),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ];
                                  },
                                ),
                              )),
                        ),
                      ),
                    ),
                    //  Container(height: double.infinity, width: double.infinity, color: Colors.white,),
                    CustomAppBar(
                        isLogo: false,
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        action: [
                          IconButton(
                            icon: SvgPicture.asset('assets/images/iIcon.svg'),
                            onPressed: () {
                              FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                  "General Instruction");
                              onShowCustomCupertinoModalSheet(
                                  context: context,
                                  child: const UTManagement(),
                                  title: 'General Instruction',
                                  icon: const Icon(Icons.clear));
                            },
                          ),
                        ],
                        isLeading: true,
                        context: context,
                        title: 'UT Trading'),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = Paint()
      ..color = AppColor.mainColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0071200, size.height * 0.2312870);
    path_0.quadraticBezierTo(size.width * 0.2985600, size.height * 0.2795741,
        size.width * 0.4980000, size.height * 0.2807870);
    path_0.quadraticBezierTo(size.width * 0.6998200, size.height * 0.2799259,
        size.width * 1.0075000, size.height * 0.2347222);
    path_0.lineTo(size.width * 1.0075000, size.height * -0.0017963);
    path_0.quadraticBezierTo(size.width * 0.2463600, size.height * -0.0019352,
        size.width * -0.0071800, size.height * -0.0019815);
    path_0.quadraticBezierTo(size.width * -0.0071600, size.height * 0.0562963,
        size.width * -0.0071200, size.height * 0.2312870);
    path_0.close();

    canvas.drawPath(path_0, paint_0);

    Paint paint_1 = Paint()
      ..color = AppColor.mainColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;
    paint_1.shader = ui.Gradient.linear(
      Offset(0, size.height * 0.11),
      Offset(size.width * 0.91, size.height * 0.11),
      [const Color(0xFF205396), const Color(0xFF0A3977)],
      [0.00, 1.00],
    );

    Path path_1 = Path();
    path_1.moveTo(0, size.height * 0.0002593);
    path_1.cubicTo(
        size.width * 0.6693300,
        size.height * 0.0001065,
        size.width * 0.6797100,
        size.height * 0.0000856,
        size.width * 0.9062800,
        size.height * 0.0000278);
    path_1.cubicTo(
        size.width * 0.8363400,
        size.height * 0.0432130,
        size.width * 0.7435800,
        size.height * 0.1063241,
        size.width * 0.5802000,
        size.height * 0.1580185);
    path_1.cubicTo(
        size.width * 0.4285200,
        size.height * 0.2109259,
        size.width * 0.1510200,
        size.height * 0.2183796,
        size.width * 0.0002600,
        size.height * 0.2277963);
    path_1.cubicTo(
        size.width * 0.0001950,
        size.height * 0.1709120,
        size.width * 0.0001950,
        size.height * 0.1709120,
        0,
        size.height * 0.0002593);
    path_1.close();

    canvas.drawPath(path_1, paint_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class EquiryModelTest {
  final int? totalUT;
  final int? totalProce;
  EquiryModelTest({this.totalProce, this.totalUT});
}
