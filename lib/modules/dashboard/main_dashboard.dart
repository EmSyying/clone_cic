import 'dart:async';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/Utils/pop_up_alert/reminder_dailog.dart';
import 'package:cicgreenloan/Utils/popupannouncement/popup_announcement.dart';
import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/configs/firebase_deeplink/deeplink_service.dart';
import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/report_module/controllers/documentation_controller.dart';
import 'package:cicgreenloan/modules/notification_modules/screens/notification.dart';
import 'package:cicgreenloan/modules/report_module/screens/view_report.dart';
import 'package:cicgreenloan/modules/ut_trading/controllers/trading_controller.dart';
import 'package:cicgreenloan/modules/notification_modules/controllers/notification_controller.dart';
import 'package:cicgreenloan/widgets/dashboard/custom_associate_member.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:upgrader/upgrader.dart';
import '../../Utils/app_settings/controllers/appsetting_controller.dart';
import 'package:cicgreenloan/modules/report_module/models/documentation_model.dart';
import 'package:cicgreenloan/Utils/custom_indicatior.dart';
import 'package:cicgreenloan/widgets/dashboard/dashboard_menu.dart';
import 'package:cicgreenloan/Utils/offline_widget.dart';
import 'package:cicgreenloan/widgets/notification/accept_notification_pop_up.dart';
import 'package:cicgreenloan/widgets/report/report_shimmer.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:new_version/new_version.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import '../../Utils/helper/local_notification.dart';
import '../../Utils/helper/underdevelopment_bottom_sheet.dart';
import '../../Utils/pin_code_controller/set_pin_code_controller.dart';
import '../../utils/helper/firebase_analytics.dart';
import '../get_funding/controller/approve_payment_detail_controller.dart';
import '../investment_module/screen/deposit_screen.dart';
import '../privilege_program/screen/privilege/privilege_screen.dart';

class MainDashboard extends StatefulWidget {
  final String? fromPage;

  const MainDashboard({Key? key, this.fromPage}) : super(key: key);
  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  final documentCon = Get.put(DocumentationController());
  final document = DocumentationModel();
  final inquiryController = Get.put(InquiryController());
  Future<List<DocumentationModel>>? futureList;
  final cusController = Get.put(CustomerController());
  final _settingCon = Get.put(SettingController());
  final fifCon = Get.put(PriceController());
  final _notificationCon = Get.put(NotificationController());
  final setPINCodeController = Get.put(SetPINCodeController());
  final controller = Get.put(ApprovePaymentController());
  // final onMessageOpenApp = OnMessageOpenApp();

  int currentIndex = 0;
  String _deviceToken = "";
  String deviceType = "";
  int appTourIndex = 0;
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  OverlayEntry? overlayEntry;
  OverlayState? overlayState;
  Future<void> onShowOverLay(BuildContext context) async {
    OverlayState? overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(builder: (context) {
      return Container(
        color: Colors.red,
        child: Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Positioned(
            top: 200,
            left: 20,
            right: 20,
            child: Material(
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0.0, 1.0),
                          color: Colors.black12,
                          blurRadius: 5)
                    ]),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.red,
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(onPressed: () {
                      setState(() {
                        overlayEntry!.remove();
                      });
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
    setState(() {
      overlayState!.insert(overlayEntry!);
    });
  }

  final String serverToken =
      'AAAAjhN5SfY:APA91bE-IRLKGTVEa21xdrg2nk1u-OGWSyAZ5Gk0GHrvzN7KlQ1CSNtVBmyvUcksTP1tyKxUL9s3eqDPGAgLD17vhn7755DrSBy8HLYMlBaZSS0A5WLyGKeAR27b50OilVdCw2K1_t3f';
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  storeDeviceToken() async {
    var token = await LocalData.getCurrentUser();
    String url =
        '${GlobalConfiguration().getValue('main_api_url')}device-token-store';
    try {
      await http.post(Uri.parse(url), headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      }, body: {
        "user_id": "${cusController.customer.value.id}",
        "token": _deviceToken,
        "type": deviceType
      }).then((response) {
        if (response.statusCode == 200) {
        } else {}
      });
    } catch (error) {
      debugPrint("$error");
    }
    // print('user Token: $token');
    // print('userID : $userID');
    // print('Print Device Token: $_deviceToken');
    // print("Device Type: $deviceType");
  }

  // @override
  // void didChangeDependencies() {
  //   onShowDialog(context);
  //   super.didChangeDependencies();
  // }

  Future<void> getDataBiotryic() async {
    await LocalData.getBiotricType('biotricType')
        .then((value) => debugPrint('Data: $value'));
  }

  final storePasscode = '';
  onPasscodeEntered(String enteredPasscode) {
    bool isValid = storePasscode == enteredPasscode;

    _verificationNotifier.add(isValid);
    setPINCodeController.submitPINCode(pinCode: enteredPasscode);
  }

  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();
  GlobalKey? actionKey;

  bool isFirstLaunch = true;

  OverlayEntry? showOverlay() {
    return OverlayEntry(builder: (context) {
      return DefaultSizeWeb(
        child: Stack(
          children: [
            Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black45),
          ],
        ),
      );
    });
  }

  onShowAllAppTour(BuildContext context) {
    _settingCon.appSettingDataList.asMap().entries.map((overlay) {
      overlay.value.overlayState = Overlay.of(context);
      overlay.value.overlayEntry = OverlayEntry(builder: (context) {
        return DefaultSizeWeb(
          child: Stack(
            children: [
              const SizedBox(
                width: double.infinity,
                height: double.infinity,
              ),
              Positioned(
                left: overlay.value.xPosition,
                top: overlay.value.yPosition,
                child: Container(
                  height: overlay.value.height,
                  width: overlay.value.width,
                  padding: const EdgeInsets.all(8),
                  color: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: overlay.value.height! - 10,
                      width: overlay.value.width! - 10,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Material(
                        child: DashBoardMenu(
                          title: '${overlay.value.label}',
                          onTap: () {},
                          icon: '${overlay.value.icon}',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                // left: _overlay.value.xPosition,
                top: overlay.value.yPosition! - 200,
                right: 20,
                // right: _overlay.value.xPosition,
                child: Container(
                  height: 190,
                  width: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xff0F50A4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                overlay.value.guideline!.label!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isFirstLaunch = false;
                                  });
                                  overlayBackground!.remove();
                                  _settingCon.appSettingDataList[appTourIndex]
                                      .overlayEntry!
                                      .remove();
                                  LocalData.storeAppTou('appTour', true);
                                })
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            overlay.value.guideline!.description!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              const Spacer(),
                              if (appTourIndex != 0)
                                GestureDetector(
                                  onTap: () {
                                    _settingCon.appSettingDataList[appTourIndex]
                                        .overlayEntry!
                                        .remove();
                                    setState(() {
                                      appTourIndex--;
                                    });
                                    _settingCon.appSettingDataList[appTourIndex]
                                        .overlayState!
                                        .insert(_settingCon
                                            .appSettingDataList[appTourIndex]
                                            .overlayEntry!);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: const Color(0xff0685CF),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: const Text(
                                      'Back',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              const SizedBox(width: 20),
                              GestureDetector(
                                onTap: () {
                                  _settingCon.appSettingDataList[appTourIndex]
                                      .overlayEntry!
                                      .remove();
                                  setState(() {
                                    if (appTourIndex !=
                                        _settingCon.appSettingDataList.length) {
                                      appTourIndex++;
                                    }
                                  });
                                  if (appTourIndex !=
                                      _settingCon.appSettingDataList.length) {
                                    _settingCon.appSettingDataList[appTourIndex]
                                        .overlayState!
                                        .insert(_settingCon
                                            .appSettingDataList[appTourIndex]
                                            .overlayEntry!);
                                  }

                                  if (appTourIndex ==
                                      _settingCon.appSettingDataList.length) {
                                    overlayBackground!.remove();
                                  }
                                  if (appTourIndex ==
                                      _settingCon.appSettingDataList.length) {
                                    setState(() {
                                      isFirstLaunch = false;
                                    });
                                    LocalData.storeAppTou('appTour', true);
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: const Color(0xff0685CF),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Text(
                                    appTourIndex ==
                                            _settingCon
                                                    .appSettingDataList.length -
                                                1
                                        ? 'Close'
                                        : 'Next',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
    }).toList();
  }

  initialObjectFinding() {
    _settingCon.appSettingDataList.asMap().entries.map((value) {
      RenderBox? renderBox4 =
          value.value.key.currentContext.findRenderObject() as RenderBox?;
      value.value.width = renderBox4!.size.width;
      value.value.height = renderBox4.size.height;

      Offset offset4 = renderBox4.localToGlobal(Offset.zero);
      value.value.xPosition = offset4.dx;
      value.value.yPosition = offset4.dy;
    }).toList();
  }

  OverlayEntry? overlayBackground;
  NotificationAppLaunchDetails? notificationAppLaunchDetails;

  bool get didNotificationLaunchApp =>
      notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;

  basicStatusCheck(NewVersion newVersion) async {
    if (Platform.isIOS) {
      newVersion.showAlertIfNecessary(context: context);
    }
  }

  advancedStatusCheck(NewVersion newVersion) async {
    final status = await newVersion.getVersionStatus();

    if (status!.canUpdate) {
      newVersion.showUpdateDialog(
        context: context,
        versionStatus: status,
        dialogTitle: 'Update Available',
        dialogText:
            'You can now update this app from ${status.localVersion} to ${status.storeVersion}',
        updateButtonText: 'Update',
        dismissButtonText: 'Mybe Later',
        dismissAction: () {
          Navigator.pop(context);
        },
      );
    }
  }

  //

  @override
  void initState() {
    _notificationCon.countNotification();
    DynamicLinkService.initDynamicLinks();
    fifCon.onHideFeatureByUser(cusController.customer.value.id);
    // final newVersion = NewVersion(
    //   iOSId: 'com.cambodianinvestorscorporation',
    //   androidId: 'com.cambodianinvestorscorporation',
    // );

    // const simpleBehavior = true;
    // if (simpleBehavior) {
    //   basicStatusCheck(newVersion);
    // } else {
    //   advancedStatusCheck(newVersion);
    // }
    // _settingCon.fetchAppSetting("App", "paragraph");

    inquiryController.getInstruction();
    inquiryController.getTradingSetting();

    _notificationCon.onGetReason();
    actionKey = GlobalKey();
    LocalData.showAppTou('appTour').then((value) {
      if (!value) {
        Future.delayed(const Duration(seconds: 1), () {
          initialObjectFinding();

          overlayBackground = showOverlay();
          Overlay.of(context)!.insert(overlayBackground!);
          onShowAllAppTour(context);
          _settingCon.appSettingDataList[0].overlayState!
              .insert(_settingCon.appSettingDataList[0].overlayEntry!);

          // WidgetsBinding.instance.addPostFrameCallback(
          //     (_) => Overlay.of(context).insert(overlayMyInvestment));
          // findAboutCiC();
        });
        setState(() {
          isFirstLaunch = true;
        });
      } else {
        setState(() {
          isFirstLaunch = false;
        });
      }
    });

    futureList = documentCon.getallDocument();
    _notificationCon.getNotification().then((notifictionList) {
      if (!_settingCon.cicAppSetting.enablePinCode!) {
        notifictionList.asMap().entries.map((e) {
          if (e.value.readAt == null &&
              e.value.data!.type == 'Announcement' &&
              !e.value.data!.expired!) {
            return showDialog(
              barrierDismissible: false,
              context: Get.context!,
              builder: (context) => PopUpAnnouncement(
                notificationModel: e.value,
              ),
            );
          }
          if (e.value.readAt == null && e.value.data!.type == 'fif-reminder') {
            _notificationCon.onReadNotification(e.value.id!);
            return showReminderDailog(
              context: Get.context!,
              title: e.value.data!.title,
              content: e.value.data!.message,
              cancelTitle: 'Remind me later',
              actionTitle: 'Pay Now',
              onActioned: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DepositeScreen(id: e.value.data!.applicationId)),
                );
              },
            );

            // showDialog(
            //   barrierDismissible: false,
            //   context: Get.context!,
            //   builder: (context) => PopUpAnnouncement(
            //     notificationModel: e.value,
            //   ),
            // );
          }
          if (e.value.readAt == null &&
              e.value.data!.type == 'ut-trading' &&
              e.value.data!.status == 'Requested') {
            return showDialog(
              barrierDismissible: false,
              context: Get.context!,
              builder: (context) => AcceptNotificationPopup(
                notificationModel: e.value,
              ),
            );
          }
        }).toList();
      }
    });

    getDataBiotryic();
    _settingCon.fetchAppVersion();
    // firebaseMessaging.configure(onMessage: (message) async {
    //   print('onMessage: $message');
    //   return;
    // }, onLaunch: (message) {
    //   Navigator.push(context,
    //       MaterialPageRoute(builder: (context) => NotificationScreen()));
    //   return;
    // }, onResume: (message) {
    //   print('onResume: $message');
    //   return;
    // });
    if (kIsWeb) {
    } else {
      // FirebaseMessaging.onMessage.listen((event) async {
      //   debugPrint("on Message");
      //   debugPrint("on Message open App0:${event.data}");
      //   _showNotification(
      //       '${event.notification!.title}', '${event.notification!.body}');

      //   // Navigator.push(context,
      //   //     MaterialPageRoute(builder: (context) => NotificationScreen()));
      // });
    }

    // onMessageOpenApp.onMessageOpenApp(context);
    firebaseMessaging.getToken().then((token) => setState(() {
          _deviceToken = token!;

          // print('Device Token: $_deviceToken');
        }));
    Future.delayed(Duration.zero).then((_) => {
          // _getPaymentSchedule = _con.fetchPayment(),
          // _isLoading = false,
        });

    // storeDeviceToken();
    if (!kIsWeb && Platform.isAndroid) {
      setState(() {
        deviceType = "android";
        // storeDeviceToken();
      });
    }
    if (!kIsWeb && Platform.isIOS) {
      setState(() {
        deviceType = "ios";
        // storeDeviceToken();
      });
    }

    super.initState();
  }

  // Future<void> _sendAnalyticsEvent() async {}

  fetchAppVersion() async {
    if (_settingCon.appSettingVersion.value.applicationNewVersion !=
        _settingCon.appSettingVersion.value.applicationVersion) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Please Update new version',
                style: Theme.of(context).textTheme.bodyText1),
            actions: [
              TextButton(
                onPressed: () {
                  launchUrl(Uri.parse(
                      'https://stackoverflow.com/questions/582185/how-to-disable-landscape-mode-in-android'));
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  List<String> imageList = [
    'assets/images/slide/CIC Banner 1 .jpg',
    'assets/images/slide/CIC Banner 2.jpg',
    'assets/images/slide/CIC Banner 3 .jpg',
    'assets/images/slide/CIC Banner 3 .jpg',
    'assets/images/slide/CIC Banner 3 .jpg',
  ];

  var timeout = const Duration(seconds: 2);
  var ms = const Duration(milliseconds: 1);
  Timer? timer;

  startTimeout([int? milliseconds]) {
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return Timer(duration, handleTimeout);
  }

  void handleTimeout() {}
  bool? switchIcon = false;

  @override
  Widget build(BuildContext context) {
    storeDeviceToken();
    _settingCon.appSettingDataList.map((value) {
      setState(() {
        value.key = GlobalKey();
      });
    }).toList();
    setState(() {});
    return DefaultSizeWeb(
      child: WillPopScope(
        onWillPop: () {
          return Future.value(false); // if true allow back else block it
        },
        child: RefreshIndicator(
          key: refreshKey,
          onRefresh: onRefresh,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: context.theme.backgroundColor,
//            backgroundColor:
//                DynamicTheme.of(context).brightness == Brightness.light
//                    ? Theme.of(context).primaryColor
//                    : Color(0xffDEE8E9).withOpacity(0.1),
              automaticallyImplyLeading: false,
              centerTitle: false,
              title: GestureDetector(
                ///add this widget to test privilege screen don't forget remore====================
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivilegeScreen(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/svgfile/Logocic.svg',
                      height: 27,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Mobile',
                      style: TextStyle(
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              actions: [
                Row(
                  children: [
                    GestureDetector(
                      key: actionKey,
                      onTap: () async {
                        // await notificationPlugin!.showNotification(
                        //     'Test Notification', 'Test Desc', 'Pay Load');

                        // _showNotification('Test', 'Test Detail');

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationScreen(),
                          ),
                        );
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10.0),
                            child: SvgPicture.asset(
                              'assets/images/svgfile/notifications.svg',
                              height: 26.0,
                            ),
                          ),
                          Obx(
                            () => _notificationCon.isLoading.value
                                ? Container()
                                : _notificationCon.countNotificatio.value != 0
                                    ? Positioned(
                                        right: 5.0,
                                        top: 0.0,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 1),
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Text(
                                            '${_notificationCon.countNotificatio.value}',
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      )
                                    : Container(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    FlutterSwitch(
                        padding: 3,
                        width: 50,
                        height: 30,
                        inactiveIcon: const Text(
                          'QM',
                          style: TextStyle(color: Colors.black),
                        ),
                        activeIcon: const Text(
                          'AM',
                          style: TextStyle(color: Colors.black),
                        ),
                        activeColor: const Color(0xff0685CF),
                        value: switchIcon!,
                        onToggle: (e) {
                          setState(() {
                            switchIcon = e;
                          });
                        }),
                    // CupertinoSwitch(
                    //   activeColor: const Color(0xff0685CF),
                    //   trackColor: Colors.grey.withOpacity(0.6),
                    //   value: switchIcon!,
                    //   onChanged: (e) {
                    //     setState(() {
                    //       debugPrint('helooooo:$switchIcon');
                    //       switchIcon = e;
                    //     });
                    //   },
                    // ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ],
              systemOverlayStyle: SystemUiOverlayStyle.light,
            ),
            body: Platform.isAndroid
                ? UpgradeAlert(child: buildBody())
                : buildBody(),
          ),
        ),
      ),
    );
  }

  Widget buildBody() {
    return ConnectivityWidgetWrapper(
      stacked: false,
      alignment: Alignment.topCenter,
      offlineWidget: Column(
        children: const [
          SizedBox(
            height: 20,
          ),
          Expanded(child: OfflineWidget()),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ShowAppTour(key: myInvestmentKey, child: Text('Hello World')),
            // ShowCaseWidget(builder: builder);
            // Showcase(key: key, child: child, description: description);
            Obx(() => !_settingCon.isLoading.value &&
                    _settingCon.slideList!.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: AspectRatio(
                        aspectRatio: 5 / 2.3,
                        child: Swiper(
                            loop: true,
                            index: currentIndex,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              if (_settingCon.slideList![index].status ==
                                  'Active') {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        _settingCon.slideList![index].image!,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }
                              return Container();
                            },
                            onIndexChanged: (value) {
                              setState(() {
                                currentIndex = value;
                              });
                            },
                            curve: Curves.easeIn,
                            autoplay: true,
                            itemCount: _settingCon.slideList!.length,
                            viewportFraction: 1,
                            scale: 0.9)),
                  )
                : const SizedBox(
                    height: 180,
                    width: double.infinity,
                  )),
            Obx(() => !_settingCon.isLoading.value
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _settingCon.slideList!
                        .asMap()
                        .entries
                        .where((element) => element.value.status == 'Active')
                        .map((e) => CustomIndicator(
                              isSelect: e.key == currentIndex,
                            ))
                        .toList(),
                  )
                : Container()),
            const SizedBox(
              height: 10,
            ),
            switchIcon == true
                ? AspectRatio(
                    aspectRatio: 3 / 2.70,
                    child: GridView.count(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      childAspectRatio: 3 / 1.80,
                      crossAxisCount: 2,
                      physics: const NeverScrollableScrollPhysics(),
                      children: _settingCon.appSettingDataList
                          .asMap()
                          .entries
                          .map((e) {
                        return CustomAssocieateMember(
                          onTap: isFirstLaunch
                              ? () {}
                              : !e.value.active!
                                  ? () async {
                                      await showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return const CustomPopupButtonSheet(
                                            assetImage:
                                                'assets/images/svgfile/underDevelopment.svg',
                                            description:
                                                'This feature is under development at the moment',
                                            title:
                                                'This feature not available yet',
                                          );
                                        },
                                      );
                                    }
                                  : e.value.route != 'get_funding'
                                      ? () {
                                          FirebaseAnalyticsHelper
                                              .setCurrentScreenName(
                                                  e.value.label!);
                                          // Beamer.of(context)
                                          //     .beamToNamed(
                                          //         '/${value.route}');
                                          Navigator.pushNamed(
                                              context, '/${e.value.route!}');
                                        }
                                      : () {
                                          // Beamer.of(context)
                                          //     .beamToNamed(
                                          //         '/${value.route}');
                                          Navigator.pushNamed(
                                              context, '/${e.value.route!}',
                                              arguments: 'equity_investment');
                                        },
                          title: e.value.label,
                          imageSvg: e.value.icon,
                        );
                      }).toList(),
                    ),
                  )
                : AspectRatio(
                    aspectRatio: 3 / 3.37,
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 10, right: 20, left: 20, bottom: 20),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(1.0, 0.0),
                              blurRadius: 4)
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Obx(
                              () => GridView.count(
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisCount: 2,
                                  childAspectRatio: 3 / 2.35,
                                  children: _settingCon.appSettingDataList
                                      .map((value) {
                                    return DashBoardMenu(
                                      key: value.key,
                                      title: value.label,
                                      onTap: isFirstLaunch
                                          ? () {}
                                          : !value.active!
                                              ? () async {
                                                  await showModalBottomSheet(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return const CustomPopupButtonSheet(
                                                        assetImage:
                                                            'assets/images/svgfile/underDevelopment.svg',
                                                        description:
                                                            'This feature is under development at the moment',
                                                        title:
                                                            'This feature not available yet',
                                                      );
                                                    },
                                                  );
                                                }
                                              : value.route != 'get_funding'
                                                  ? () {
                                                      FirebaseAnalyticsHelper
                                                          .setCurrentScreenName(
                                                              value.label!);
                                                      // Beamer.of(context)
                                                      //     .beamToNamed(
                                                      //         '/${value.route}');
                                                      Navigator.pushNamed(
                                                          context,
                                                          '/${value.route!}');
                                                    }
                                                  : () {
                                                      // Beamer.of(context)
                                                      //     .beamToNamed(
                                                      //         '/${value.route}');
                                                      Navigator.pushNamed(
                                                          context,
                                                          '/${value.route!}',
                                                          arguments:
                                                              'equity_investment');
                                                    },
                                      icon: value.icon,
                                    );
                                  }).toList()),
                            ),

                            // Spacer(),
                            // AspectRatio(
                            //   aspectRatio: 5 / 3,
                            //   child: SvgPicture.asset(
                            //     'assets/images/svgfile/horizontal_divider.svg',
                            //   ),
                            // ),
                            // Spacer(),
                            AspectRatio(
                              aspectRatio: 6.20 / 7,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 3 / 0.1,
                                    child: SvgPicture.asset(
                                      'assets/images/svgfile/horizontal_divider.svg',
                                    ),
                                  ),
                                  AspectRatio(
                                    aspectRatio: 3 / 0.1,
                                    child: SvgPicture.asset(
                                      'assets/images/svgfile/horizontal_divider.svg',
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Row(
                              children: [
                                // AspectRatio(
                                //   aspectRatio: 3 / 3.4,
                                //   child: SvgPicture.asset(
                                //     'assets/images/svgfile/vertical_divider.svg',
                                //   ),
                                // ),
                                AspectRatio(
                                  aspectRatio: 5.11 / 6,
                                  child: SvgPicture.asset(
                                    'assets/images/svgfile/vertical_divider.svg',
                                  ),
                                ),
                              ],
                            ),
                            // Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'RECENT DOCUMENTS',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            SizedBox(
              height: 120,
              width: double.infinity,
              child: FutureBuilder<List<DocumentationModel>>(
                future: futureList,
                builder: (BuildContext context,
                    AsyncSnapshot<List<DocumentationModel>> snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done &&
                      documentCon.documentationList.isNotEmpty) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(15),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var item = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewReport(
                                          documentationModel: item,
                                        )));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(1.0, 0.0),
                                      color: Colors.black12,
                                      blurRadius: 4)
                                ]),
                            width: 330,
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(item.cover!),
                                          fit: BoxFit.fill)),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Text(
                                          item.title!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Text(
                                          item.publishedAt!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey[500],
                                  size: 18,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: snapshot.data!.length,
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting &&
                      documentCon.documentationList.isEmpty) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const ReportShimmer();
                      },
                      itemCount: 4,
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.done &&
                      documentCon.documentationList.isEmpty) {
                    return Container();
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onRefresh() async {
    await _settingCon.fetchSlide();
  }

  Future<void>? onNotificationInLowerVersions(
      ReceivedNotification receivedNotification) {
    return null;
  }

  onNotificationClick(String? payload) {
    Navigator.push(context, MaterialPageRoute(builder: (coontext) {
      return const NotificationScreen();
    }));
  }
}