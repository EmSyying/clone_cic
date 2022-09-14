import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
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
import '../../../Utils/helper/color.dart';
import '../../../utils/form_builder/custom_material_modal_sheet.dart';
import '../../../utils/helper/custom_appbar.dart';
import '../../../utils/helper/firebase_analytics.dart';
import '../../../widgets/get_funding/custom_call_center.dart';
import '../../../widgets/ut_tradding/custom_buy_card.dart';
import '../../../widgets/ut_tradding/custom_fun_card.dart';
import '../../../widgets/ut_tradding/custom_maket_trading_card.dart';
import '../../../widgets/ut_tradding/trade_session_shimmer.dart';
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
    inquiryController.onViewLastTradingInfo();
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
  final tradingPage = [
    const MatchTrade(),
    const UnMatchTrade(),
    const CancelTrade(),
  ];
  int segmentedControlValue = 0;

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
            backgroundColor: const Color(0xFFE5E5E5),
            body: Column(
              children: [
                Stack(
                  children: [
                    CustomPaint(
                      size: Size(double.infinity,
                          MediaQuery.of(context).size.height * 1),
                      painter: RPSCustomPainter(),
                    ),
                    // SvgPicture.asset(
                    //   'assets/images/svgfile/background-ut.svg',
                    // ),
                    Positioned(
                      top: 100.0,
                      right: 0.0,
                      left: 0.0,
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
                                                              left: 20.0,
                                                              right: 20.0),
                                                      child:
                                                          CustomMaketTradingCar(
                                                        onViewLastTrading: () {
                                                          FirebaseAnalyticsHelper
                                                              .sendAnalyticsEvent(
                                                                  "View Last Trading Information");
                                                          debugPrint(
                                                              "View Trading:${inquiryController.viewLastTradingInfo.value.linkTradingInfo}");
                                                          context.push(
                                                              '/ut-trading/view-last-trading-info?url=${inquiryController.viewLastTradingInfo.value.linkTradingInfo}&&title=View Last Trading Info');
                                                        },
                                                        fromTime: inquiryController
                                                            .tradingSettingData
                                                            .data!
                                                            .market!
                                                            .fromTime,
                                                        toTime: inquiryController
                                                            .tradingSettingData
                                                            .data!
                                                            .market!
                                                            .toTime,
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
                                                    ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 20.0),
                                                padding: const EdgeInsets.only(
                                                    left: 20, right: 20),
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                        height: 3,
                                                        width: 34,
                                                        decoration: BoxDecoration(
                                                            color: const Color(
                                                                0xffBFBFBF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                      ),
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
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: ui.Color(
                                                              0XFF848F92)),
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
                            padding: EdgeInsets.zero,
                            icon: SvgPicture.asset(
                              'assets/images/iIcon.svg',
                              width: 45.0,
                              height: 45.0,
                            ),
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
                          CustomCallCenter(
                              isUT: true,
                              url: inquiryController
                                  .tradingSettingData.data!.telegramLink),
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
      ..color = const ui.Color.fromARGB(255, 5, 89, 185)
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

    // canvas.drawPath(path_1, paint_1);
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
