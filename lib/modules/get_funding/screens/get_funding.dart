import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:go_router/go_router.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_material_modal_sheet.dart';
import 'package:cicgreenloan/Utils/helper/local_storage.dart';
import 'package:cicgreenloan/Utils/popupannouncement/popup_announcement.dart';
import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/modules/get_funding/screens/history_get_funding.dart';
import 'package:cicgreenloan/modules/member_directory/models/user.dart';
import 'package:cicgreenloan/modules/get_funding/controller/debt_investment_controller.dart';
import 'package:cicgreenloan/modules/get_funding/controller/equity_investment_controller.dart';
import 'package:cicgreenloan/modules/get_funding/screens/debt_investment.dart';
import 'package:cicgreenloan/modules/get_funding/screens/equity_investment.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity/connectivity.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../Utils/helper/firebase_analytics.dart';

class HomePage extends StatefulWidget {
  final bool? isNavigator;

  const HomePage({Key? key, @queryParam this.isNavigator}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    return DefaultSizeWeb(
      child: WillPopScope(
        onWillPop: () async =>
            widget.isNavigator != null && widget.isNavigator! ? true : false,
        child: Scaffold(
          body: ShowCaseWidget(
            onComplete: (index, state) {
              LocalStorage.storeData(key: 'ISFIRST_GET_FUNDING', value: true);
            },
            // onFinish: () {
            //   LocalStorage.storeData(key: 'ISFIRST_GET_FUNDING', value: false);
            // },
            builder: Builder(builder: (context) {
              return const ShowCaseBody();
            }),
          ),
        ),
      ),
    );
  }
}

class ShowCaseBody extends StatefulWidget {
  const ShowCaseBody({Key? key}) : super(key: key);

  @override
  State<ShowCaseBody> createState() => _ShowCaseBodyState();
}

class _ShowCaseBodyState extends State<ShowCaseBody>
    with TickerProviderStateMixin {
  bool isFirst = true;
  bool? isEmty = false;
  String? buttonTitle = 'Test Clear Data';
  String? userToken;
  ConnectivityResult? result;
  String? _deviceToken;
  User? userInfo;
  int? userID;
  String? deviceType = "";
  String? pageName = 'equity_investment';
  final debtCon = Get.put(DebtInvestmentController());
  final equityController = Get.put(EquityInvestmentController());
  final equityCon = Get.put(EquityInvestmentController());

  ///virak
  final GlobalKey _one = GlobalKey();
  startShowCase() async {
    isFirst = await LocalStorage.getBooleanValue(key: 'ISFIRST_GET_FUNDING');
    isFirst == false
        ? Future.delayed(const Duration(milliseconds: 500), () {
            WidgetsBinding.instance.addPostFrameCallback((duration) =>
                ShowCaseWidget.of(context)!.startShowCase([_one]));
          })
        : null;
  }

  Future<void> onShowDialog() async {
    showDialog(
      context: context,
      builder: (context) {
        return const PopUpAnnouncement();
      },
    );
  }

  int currentIndex = 0;

  @override
  void dispose() {
    // debtCon.tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    startShowCase();
    debtCon.tabController = TabController(
        length: 2, vsync: this, initialIndex: debtCon.tapcurrentIndex.value);
    debtCon.tabController.addListener(() {
      setState(() {
        debtCon.tapcurrentIndex.value = debtCon.tabController.index;
      });
    });
    equityCon.fetchCallCenter();
    super.initState();
  }

  storeDeviceToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('current_user');
    String url =
        '${GlobalConfiguration().getValue('main_api_url')}device-token-store';
    try {
      await http.post(Uri.parse(url), headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      }, body: {
        "user_id": "$userID",
        "token": "$_deviceToken",
        "type": "$deviceType"
      }).then((response) {
        if (response.statusCode == 200) {
        } else {}
      });
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> getDefaulLang() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    S.load(Locale((pref.getString('locale'))!));
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  List<String>? myname;

  Future<void> getUser() async {
    myname = [
      'Srun Tola',
      'Srun Dina',
    ];
  }

  Future<User> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('current_user');

    String userUrl = '${GlobalConfiguration().getValue('main_api_url')}user';
    await http.get(Uri.parse(userUrl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }).then((response) async {
      if (response.statusCode == 200) {
        setState(() {
          userID = json.decode(response.body)['id'];
        });
      }
    }).catchError((eror) {
      debugPrint("$eror");
    });
    return userInfo!;
  }

  String? fromPage;
  @override
  Widget build(BuildContext context) {
    storeDeviceToken();
    return CupertinoScaffold(
      body: Builder(
        builder: (context) => CupertinoPageScaffold(
          child: Scaffold(
            body: Column(
              children: [
                CustomAppBar(
                  context: context,
                  title: 'Get Funding',
                  action: [
                    GestureDetector(
                      onTap: () async {
                        FirebaseAnalyticsHelper.sendAnalyticsEvent('history');
                        await onShowCustomCupertinoModalSheet(
                          context: context,
                          icon: const Icon(Icons.close_rounded),
                          title: "History",
                          onTap: () {},
                          child: const HistoryGetFunding(),
                        );
                      },
                      child: SvgPicture.asset("assets/images/history.svg"),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    kIsWeb
                        ? Container()
                        : Platform.isIOS || Platform.isAndroid
                            ? GestureDetector(
                                onTap: () async {
                                  debugPrint(
                                      '===================:${equityCon.callCenter.value.link}');
                                  // var url = Uri(
                                  //   scheme: 'https',
                                  //   host: 't.me',
                                  //   path: 'horn_chhany',
                                  // );
                                  // await launch('${equityCon.callCenter.value.link}');
                                  await launchUrl(
                                    Uri.parse(
                                        '${equityCon.callCenter.value.link}'),
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                                child: Showcase(
                                  onToolTipClick: () {
                                    LocalStorage.storeData(
                                        key: 'ISFIRST_GET_FUNDING',
                                        value: true);
                                  },
                                  onTargetClick: () {
                                    debugPrint('end');
                                  },
                                  disposeOnTap: true,
                                  overlayOpacity: 0.5,
                                  showcaseBackgroundColor:
                                      Theme.of(context).primaryColor,
                                  textColor: Colors.white,
                                  key: _one,
                                  description: 'Need help?    x',
                                  descTextStyle: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 5),
                                  overlayPadding: const EdgeInsets.symmetric(
                                      horizontal: 18),
                                  shapeBorder: const CircleBorder(),
                                  child: SvgPicture.asset(
                                    "assets/images/svgfile/telegram-icons.svg",
                                    height: 35.0,
                                    width: 35.0,
                                  ),
                                ),
                              )
                            : Container(),
                    const SizedBox(width: 20.0),
                  ],
                  leading: pageName != ''
                      ? IconButton(
                          icon: kIsWeb
                              ? const Icon(Icons.arrow_back)
                              : Platform.isAndroid
                                  ? const Icon(Icons.arrow_back)
                                  : const Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            debugPrint("Context router pop");
                            context.pop();
                          },
                        )
                      : null,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0.0, 1.0),
                            color: Colors.black12,
                            blurRadius: 6)
                      ]),
                  child: TabBar(
                    onTap: (i) {
                      if (i == 0) {
                        setState(() {
                          pageName = 'equity_investment';
                          FirebaseAnalyticsHelper.sendAnalyticsEvent(
                              "Equity Investment");
                        });
                      } else {
                        setState(() {
                          pageName = 'debt_investment';
                          FirebaseAnalyticsHelper.sendAnalyticsEvent(
                              "Debt Investment");
                        });
                      }
                    },
                    labelStyle: TextStyle(
                        fontFamily: 'DMSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor),
                    indicatorWeight: 3,
                    controller: debtCon.tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Theme.of(context).primaryColor,
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor:
                        Get.theme.brightness == Brightness.light
                            ? Colors.grey[500]
                            : Colors.white,
                    tabs: const [
                      Tab(
                        text: 'Equity Investment',
                      ),
                      Tab(
                        text: 'Debt Investment',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: debtCon.tabController,
                    children: const [
                      EquityInvestment(),
                      DebtInvestment(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
