import 'dart:async';
import 'package:cicgreenloan/Utils/form_builder/custom_material_modal_sheet.dart';
import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/modules/investment_module/screen/history_appbar.dart';
import 'package:cicgreenloan/utils/helper/cic/cic_guider.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:passcode_screen/passcode_screen.dart';

import '../../Utils/helper/custom_appbar.dart';
import '../../Utils/offline_widget.dart';
import '../../configs/route_configuration/route.dart';
import '../../utils/helper/firebase_analytics.dart';
import '../../widgets/get_funding/custom_shimmer_contact_history.dart';
import '../guilder/guider_controller.dart';
import '../investment_module/controller/investment_controller.dart';
import '../investment_module/screen/cic_equity_fund.dart';
import '../investment_module/screen/cic_fixed_income.dart';
import '../member_directory/controllers/customer_controller.dart';

class Dashboard extends StatefulWidget {
  final bool? isNavigator;
  final String? tabName;
  const Dashboard({Key? key, this.isNavigator, this.tabName}) : super(key: key);
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  final cusController = Get.put(CustomerController());
  final priceController = Get.put(PriceController());
  final _guidkey = Get.put(CiCGuidController());

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  // var priceList;

  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  bool isAuthenticated = false;

  String storePasscode = '1234';
  _onPasscodeEntered(String enteredPasscode) {
    bool isValid = storePasscode == enteredPasscode;

    _verificationNotifier.add(isValid);
    if (isValid) {
      isAuthenticated = isValid;
    }
  }

  showLockScreen(BuildContext? context) {
    Navigator.push(
        context!,
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) =>
              PasscodeScreen(
            title: const Text(
              'Enter App Passcode',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            passwordEnteredCallback: _onPasscodeEntered,
            cancelButton: const Text('Cancel'),
            deleteButton: const Text(
              'Delete',
              style: TextStyle(fontSize: 16, color: Colors.white),
              semanticsLabel: 'Delete',
            ),
            shouldTriggerVerification: _verificationNotifier.stream,
            backgroundColor: Colors.black.withOpacity(0.8),
            passwordDigits: 6,
          ),
        ));
  }

  final routerInvestment =
      GoRouter.of(router.routerDelegate.navigatorKey.currentState!.context);
  @override
  void didChangeDependencies() {
    debugPrint("router investment:${router.location}");
    if (routerInvestment.location.contains('/investment')) {
      priceController.tabController.index = 0;
    } else {
      priceController.tabController.index = 1;
    }

    super.didChangeDependencies();
  }

  @override
  void initState() {
    // priceController.onHideFeatureByUser();
    debugPrint("Tab name:${widget.tabName}");
    priceController.tapcurrentIndex(0);
    debugPrint('Local Storage : ${priceController.allowFeaturebyTag.value}');
    if (widget.tabName == 'cic-equity-fund') {
      priceController.tapcurrentIndex.value = 0;
    } else {
      priceController.tapcurrentIndex.value = 1;
    }

    priceController.tabController = TabController(
        length: priceController.allowFeaturebyTag.value ? 2 : 1,
        vsync: this,
        initialIndex: priceController.tapcurrentIndex.value);

    priceController.tabController.addListener(() {
      setState(() {
        priceController.tapcurrentIndex.value =
            priceController.tabController.index;
      });
    });

    priceController.onFetchPrice();
    priceController.getSharePrice();
    priceController.getAllChartList();
    priceController.fetchCertificate();
    priceController.fetchOnReturnInvestment();
    priceController.getShareSubHistories();
    priceController.isFromWallet.value = false;

    debugPrint("is Hide Feature:${priceController.allowFeaturebyTag.value}");

    super.initState();
  }

  Future<void> _cicEquityGuide() async {
    if (priceController.allowFeaturebyTag.value) {
      await CiCApp.showOverlays(
        context: context,
        key: (_) => _guidkey.investmentKey[_].key!,
        objectSettingBuilder: (_) => ObjectSetting(
            edgeInsets: _ == 0 || _ == 4
                ? const EdgeInsets.symmetric(horizontal: 10)
                : const EdgeInsets.all(10),
            radius: _ == 2 ? BorderRadius.circular(50) : null,
            paddingSize: _ == 0 || _ == 4
                ? const Size(0, -5)
                : _ == 3
                    ? const Size(0, -10)
                    : null),
        titleBuilder: (_) => _guidkey.investmentKey[_].title ?? '',
        descriptionBuilder: (_) => _guidkey.investmentKey[_].description ?? '',
        itemCount: _guidkey.investmentKey.length,
        allowSkip: true,
        overlaySetting: OverlaySetting(),
      );
    } else {
      await CiCApp.showOverlays(
        context: context,
        key: (_) => _guidkey.investmentKeyNoFiF[_].key!,
        objectSettingBuilder: (_) => ObjectSetting(
            edgeInsets: _ == 0 || _ == 4
                ? const EdgeInsets.symmetric(horizontal: 10)
                : const EdgeInsets.all(10),
            radius: _ == 1 ? BorderRadius.circular(50) : null,
            paddingSize: _ == 0
                ? const Size(0, 0)
                : _ == 2
                    ? const Size(0, -10)
                    : null),
        titleBuilder: (_) => _guidkey.investmentKeyNoFiF[_].title ?? '',
        descriptionBuilder: (_) =>
            _guidkey.investmentKeyNoFiF[_].description ?? '',
        itemCount: _guidkey.investmentKeyNoFiF.length,
        allowSkip: true,
        overlaySetting: OverlaySetting(),
      );
    }
  }

  void _cicFixedIncomeGuide() {
    CiCApp.showOverlays(
      context: context,
      key: (_) => _guidkey.investmentFiF[_].key!,
      objectSettingBuilder: (_) => ObjectSetting(
          edgeInsets: _ == 0 ? const EdgeInsets.only(top: 15) : null,
          radius: _ == 0 ? BorderRadius.circular(12) : null,
          paddingSize: _ == 0 ? const Size(-39, -29) : null),
      titleBuilder: (_) => _guidkey.investmentFiF[_].title ?? '',
      descriptionBuilder: (_) => _guidkey.investmentFiF[_].description ?? '',
      itemCount: _guidkey.investmentFiF.length,
      allowSkip: true,
      overlaySetting: OverlaySetting(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultSizeWeb(
      child: CupertinoScaffold(
        body: Builder(
          builder: (context) => CupertinoPageScaffold(
            child: Scaffold(
              backgroundColor: AppColor.backgroundColor,
              body: ConnectivityWidgetWrapper(
                stacked: false,
                alignment: Alignment.bottomCenter,
                offlineWidget: Column(
                  children: [
                    AppBar(
                      backgroundColor: Theme.of(context).primaryColor,
                      automaticallyImplyLeading:
                          widget.isNavigator != null && widget.isNavigator!
                              ? true
                              : false,
                      centerTitle: false,
                      elevation: 0.0,
                      title: Text(
                        'My Investment',
                        style: Theme.of(context).textTheme.headline6,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Expanded(
                      child: OfflineWidget(),
                    ),
                  ],
                ),
                child: Obx(
                  () => Stack(
                    children: [
                      const SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                      ),
                      // if (!priceController.isLoadingSharePrice.value)
                      SizedBox(
                        height: 242,
                        width: double.infinity,
                        child: SvgPicture.asset(
                          'assets/images/svgfile/Investment_backg.svg',
                          color: Theme.of(context).primaryColor,
                          fit: BoxFit.fill,
                        ),
                      ),
                      if (priceController.allowFeaturebyTag.value)
                        Positioned(
                          top: 90,
                          left: 0,
                          right: 0,
                          child: TabBar(
                            onTap: (e) {
                              priceController.tapcurrentIndex.value = e;
                              debugPrint(
                                  'MY Investment Tab${routerInvestment.location}');
                            },
                            padding: const EdgeInsets.only(left: 10.0),
                            controller: priceController.tabController,
                            isScrollable: true,
                            indicatorColor: Colors.white,
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: [
                              Tab(
                                key: _guidkey.investmentKey[0].key =
                                    GlobalKey(),
                                child: const Text('CiC EQUITY FUND'),
                              ),

                              Tab(
                                key: _guidkey.investmentKey[4].key =
                                    GlobalKey(),
                                child: const Text('CiC FIXED INCOME FUND'),
                              )

                              // Tab(
                              //   child: Text('CiC REAL ESTATE FUND'),
                              // ),
                            ],
                          ),
                        ),

                      priceController.allowFeaturebyTag.value
                          ? Positioned(
                              top: 160.0,
                              left: 0.0,
                              right: 0.0,
                              bottom: 0.0,
                              child: TabBarView(
                                controller: priceController.tabController,
                                children: const [
                                  CiCEquityFund(
                                    tabName: 'cic-equity-fund',
                                  ),
                                  CiCFixedIncome()
                                ],
                              ),
                            )
                          : const Positioned(
                              top: 111.0,
                              left: 0.0,
                              right: 0.0,
                              bottom: 0.0,
                              child: CiCEquityFund(),
                            ),
                      SizedBox(
                        height: 100,
                        child: CustomAppBar(
                            isLeading: true,
                            isLogo: false,
                            context: context,
                            action: [
                              //  isContract == true

                              GestureDetector(
                                onTap: () async {
                                  priceController.tabController.index == 0
                                      ? priceController.cicEquityScroll
                                          .animateTo(0,
                                              duration: const Duration(
                                                  milliseconds: 200),
                                              curve: Curves.linear)
                                          .then((value) {
                                          Future.delayed(
                                              const Duration(milliseconds: 500),
                                              () {
                                            _cicEquityGuide();
                                          });
                                        })
                                      : priceController.cicFixedIncomeScroll
                                          .animateTo(0,
                                              duration: const Duration(
                                                  milliseconds: 200),
                                              curve: Curves.linear)
                                          .then((value) {
                                          Future.delayed(
                                              const Duration(milliseconds: 500),
                                              () {
                                            _cicFixedIncomeGuide();
                                          });
                                        });
                                  // await LocalData.storeAppTou('appTour', true);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: SvgPicture.asset(
                                    'assets/images/demo.svg',
                                  ),
                                ),
                              ),

                              GestureDetector(
                                onTap: () async {
                                  debugPrint("Workk===>");
                                  FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                      'contract history');
                                  await onShowCustomCupertinoModalSheet(
                                    context: context,
                                    icon: const Icon(Icons.close_rounded),
                                    title: "Contract History",
                                    onTap: () {},
                                    child: priceController
                                            .isLoadingContractHistory.value
                                        ? const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 10),
                                            child: ShimmerContactHistory(),
                                          )
                                        : const FIFHistoryAppbar(),
                                  );
                                },
                                child: priceController.tabController.index == 1
                                    ? SvgPicture.asset(
                                        "assets/images/history.svg")
                                    : const SizedBox.shrink(),
                              ),

                              const SizedBox(width: 23)
                            ],
                            backgroundColor: Colors.transparent,
                            elevation: 0.0,
                            title: cusController.customer.value.fullName != null
                                ? 'My Investment'
                                : 'My Investment'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
