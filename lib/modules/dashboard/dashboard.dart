import 'dart:async';
import 'package:cicgreenloan/Utils/form_builder/custom_material_modal_sheet.dart';
import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/modules/investment_module/screen/history_appbar.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:passcode_screen/passcode_screen.dart';

import '../../Utils/helper/custom_appbar.dart';
import '../../Utils/offline_widget.dart';
import '../../utils/helper/firebase_analytics.dart';
import '../../widgets/get_funding/custom_shimmer_contact_history.dart';
import '../investment_module/controller/investment_controller.dart';
import '../investment_module/model/share_price_model.dart';
import '../investment_module/screen/cic_equity_fund.dart';
import '../investment_module/screen/cic_fixed_income.dart';
import '../member_directory/controllers/customer_controller.dart';

class Dashboard extends StatefulWidget {
  final bool? isNavigator;
  const Dashboard({Key? key, this.isNavigator}) : super(key: key);
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  final cusController = Get.put(CustomerController());
  final priceController = Get.put(PriceController());

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
  var f = NumberFormat('#,###.00', 'en_US');
  var n = NumberFormat('#,###', 'en_US');
  var formatnumber = 12344556.78;
  DateTime dateTime = DateTime.now();
  DateTime? day1;
  DateTime? day2;
  DateTime? day3;
  DateTime? day4;
  DateTime? day5;

  List<SalesData> listData = [
    SalesData('2018', 2.4),
    SalesData('2019', 4.8),
    SalesData('2020', 5.0),
    SalesData('2021', 7.12),
  ];

  List<Evolution> reversList = [];

  // var priceList;
  @override
  void initState() {
    priceController.tapcurrentIndex(0);

    cusController.getUser();
    priceController.onFetchPrice();
    priceController.getSharePrice();
    debugPrint("is Hide Feature:${priceController.isHideFeatureByUser.value}");
    priceController.tabController = TabController(
        length: priceController.isHideFeatureByUser.value == true ? 2 : 1,
        vsync: this,
        initialIndex: priceController.tapcurrentIndex.value);
    priceController.tabController.addListener(() {
      setState(() {
        priceController.tapcurrentIndex.value =
            priceController.tabController.index;
      });
    });
    super.initState();
  }

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

  showLockScreen() {
    Navigator.push(
        Get.context!,
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
                    const Expanded(child: OfflineWidget()),
                  ],
                ),
                child: Stack(
                  children: [
                    const SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    SizedBox(
                      height: 242,
                      width: double.infinity,
                      child: SvgPicture.asset(
                        'assets/images/svgfile/Investment_backg.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    if (priceController.isHideFeatureByUser.value == true)
                      Positioned(
                        top: 90,
                        left: 0,
                        right: 0,
                        child: TabBar(
                          onTap: (e) {
                            setState(() {
                              if (priceController.tabController.index == 0) {
                                FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                    'tab bar CiC EQUITY FUND');
                              } else {
                                FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                    'tab bar CiC FIXED INCOME FUND');
                              }
                              priceController.tabController;
                            });
                          },
                          padding: const EdgeInsets.only(left: 10.0),
                          controller: priceController.tabController,
                          isScrollable: true,
                          indicatorColor: Colors.white,
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: const [
                            Tab(
                              child: Text('CiC EQUITY FUND'),
                            ),

                            Tab(
                              child: Text('CiC FIXED INCOME FUND'),
                            )

                            // Tab(
                            //   child: Text('CiC REAL ESTATE FUND'),
                            // ),
                          ],
                        ),
                      ),
                    priceController.isHideFeatureByUser.value == true
                        ? Positioned(
                            top: 160.0,
                            left: 0.0,
                            right: 0.0,
                            bottom: 0.0,
                            child: TabBarView(
                              controller: priceController.tabController,
                              children: const [
                                CiCEquityFund(),
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
                          // automaticallyImplyLeading:
                          //     widget.isNavigator != null && widget.isNavigator
                          //         ? true
                          //         : false,
                          // centerTitle: false,
                          action: [
                            //  isContract == true

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
                                  child: priceController.isLoading.value
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
    );
  }

  onRefresh() {}
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
