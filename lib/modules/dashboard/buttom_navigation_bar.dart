import 'dart:async';

import 'package:cicgreenloan/modules/dashboard/main_dashboard.dart';
import 'package:cicgreenloan/modules/member_directory/screens/new_profile_ui/new_persional_profile.dart';
import 'package:cicgreenloan/modules/qr_code/qr_code.dart';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/configs/firebase_deeplink/deeplink_service.dart';
import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import '../../Utils/helper/color.dart';
import '../../Utils/app_settings/controllers/appsetting_controller.dart';
import '../../Utils/pin_code_controller/set_pin_code_controller.dart';
import '../../configs/route_configuration/route.dart';
import '../../generated/l10n.dart';
import '../../Utils/helper/app_pin_code.dart' as app_pin_code;
import '../event_module/screen/event.dart';

class PaymentSchedule extends StatefulWidget {
  final String? fromPage;
  const PaymentSchedule({Key? key, this.fromPage}) : super(key: key);
  @override
  State<PaymentSchedule> createState() => _PaymentScheduleState();
}

class _PaymentScheduleState extends State<PaymentSchedule> {
  final cusController = Get.put(CustomerController());

  final _settingCon = Get.put(SettingController());
  final _userController = Get.put(CustomerController());
  final setPINCodeController = Get.put(SetPINCodeController());
  // var pinCode;

  String homeMenu = '';
  String notificationMenu = '';
  String profileMenu = '';
  var saveUserToken = '';

  final LocalAuthentication auth = LocalAuthentication();
  Future<void> _authenticate() async {
    if (!kIsWeb) {
      List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();

      if (Platform.isAndroid) {
        if (availableBiometrics.contains(BiometricType.strong) ||
            availableBiometrics.contains(BiometricType.weak) ||
            availableBiometrics.contains(BiometricType.fingerprint)) {
          await LocalData.storeBiotricType('biotricType', 'fingerPrint');
        }
      } else {
        if (availableBiometrics.contains(BiometricType.face)) {
          await LocalData.storeBiotricType('biotricType', 'faceId');
        } else {
          await LocalData.storeBiotricType('biotricType', 'touchId');
        }
      }

      bool authenticated = false;
      try {
        _settingCon.isAuthenticating.value = true;
        _settingCon.authorized.value = 'Authenticating';
        authenticated = await auth.authenticate(
          localizedReason: 'Let OS determine authentication method',
        );
        if (authenticated) {
          setPinCon.isLogin(true);
          Navigator.pop(router.navigator!.context);
        }

        _settingCon.isAuthenticating.value = false;
        _settingCon.authorized.value = 'Authenticating';
      } on PlatformException catch (e) {
        debugPrint("$e");
      }

      final String message = authenticated ? 'Authorized' : 'Not Authorized';
      _settingCon.authorized.value = message;
    }
  }

  void cancelAuthentication() {
    auth.stopAuthentication();
  }

  onShowFingerPrint() async {
    await LocalData.getAuthenValue('authen').then((value) async {
      if (value) {
        await _authenticate();
      }
    });
  }

  final appSettingCon = Get.put(SettingController());

  /*final QuickActions _quickActions = const QuickActions();

  Future<void> _initQuickAction() async {
    await _quickActions.initialize((shortcutType) {
      if (shortcutType.isNotEmpty) {
        context.go('/$shortcutType');
      }
    });
    _quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'qr-screen', localizedTitle: 'Scan Qr Code', icon: ''),
      const ShortcutItem(
          type: 'ut-trading', localizedTitle: 'UT Trading', icon: ''),
      const ShortcutItem(
          type: 'directory', localizedTitle: 'Directory', icon: ''),
    ]);
  }*/

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // _initQuickAction();
    cusController.getUser();

    LocalData.showAppTou('appTour').then((value) async {
      if (appSettingCon.cicAppSetting.enablePinCode!) {
        if (value) {
          if (_userController.customer.value.screenLock!.temporary!) {
            app_pin_code.showLockScreen();
          } else if (widget.fromPage != 'loginPage') {
            setPINCodeController.isLogin(false);
            setPINCodeController.update();

            // _showLockScreen();
            // onShowFingerPrint();
            app_pin_code.showLockScreen(context: context);
          }
        }
      }
    });

    getLanguage();

    getSetting();
    _settingCon.fetchAppVersion();
    // fetchAppVersion();
    _userController.isLoginSuccess(true);
    // homeMenu = S.of(context).homeMenu;
    // notificationMenu = S.of(context).notificationMenu;
    // profileMenu = S.of(context).profile;
    super.initState();
  }

  getSetting() async {
    // SharedPreferences pref = await SharedPreferences.getInstance();
  }

  Future<void> getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    S.load(Locale((prefs.getString('locale'))!));
  }

  Future<void> getUserToke() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  Future<void> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('locale') != null) {
      S.load(Locale((prefs.getString('locale'))!));
    } else {
      S.load(const Locale('en'));
    }
  }

  fetchAppVersion() async {
    if (_settingCon.appSettingVersion.value.applicationNewVersion !=
        _settingCon.appSettingVersion.value.applicationVersion) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Please Update new version',
                style: Theme.of(context).textTheme.bodyText1),
            actions: const [
              // FlatButton(
              //   onPressed: kIsWeb
              //       ? () {
              //           launch(
              //               _settingCon.appSettingVersion.value.androidLink!);
              //           Navigator.pop(context);
              //         }
              //       : Platform.isAndroid
              //           ? () {
              //               launch(_settingCon
              //                   .appSettingVersion.value.androidLink!);
              //               Navigator.pop(context);
              //             }
              //           : () {
              //               launch(_settingCon.appSettingVersion.value.iosInk!);
              //               Navigator.pop(context);
              //             },
              //   child: Text('OK'),
              // ),
            ],
          );
        },
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final router = GoRouter.of(context);
    // if (router.location.contains('event')) {
    //   _settingCon.selectedIndex = 2;
    // }
    debugPrint("Build from BottomNavigationbar");
    // saveUserToken = StorageUtil.getString('current_user');

    return GetBuilder(
      init: SettingController(),
      builder: (SettingController setting) {
        return DefaultSizeWeb(
          child: Scaffold(
            bottomNavigationBar: setting.isHideBottomNavigation
                ? null
                : BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    selectedFontSize: 12,
                    unselectedFontSize: 12,
                    //        selectedLabelStyle: TextStyle(color: Colors.white),
                    // type: BottomNavigationBarType.fixed,

                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          'assets/images/svgfile/menu/home.svg',
                          color: const Color(0XFF848F92),
                        ),
                        label: S.of(context).homeMenu,
                        activeIcon: SvgPicture.asset(
                            'assets/images/svgfile/menu/HomeActiveIcon.svg'),
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                            'assets/images/svgfile/menu/qrcodeInactive.svg',
                            color: const Color(0XFF848F92)),
                        activeIcon: SvgPicture.asset(
                            'assets/images/svgfile/menu/qrCodeActive.svg',
                            color: const Color(0XFF848F92)),
                        label: S.of(context).qrCode,
                      ),
                      // BottomNavigationBarItem(
                      //   icon: Icon(Icons.book),
                      //   activeIcon: Icon(Icons.book),
                      //   label: 'Learning',
                      // ),
                      // BottomNavigationBarItem(
                      //   icon: SvgPicture.asset(
                      //       'assets/images/svgfile/menu/inactivesearchmenu.svg'),
                      //   activeIcon: SvgPicture.asset(
                      //       'assets/images/svgfile/menu/activesearchmenu.svg'),
                      //   label: S.of(context).search,
                      // ),
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset(
                              'assets/images/svgfile/menu/eventInactive.svg'),
                          activeIcon: SvgPicture.asset(
                              'assets/images/svgfile/menu/eventActive.svg'),
                          label: S.of(context).event),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                            'assets/images/svgfile/menu/account.svg',
                            color: const Color(0XFF848F92)),
                        activeIcon: SvgPicture.asset(
                            'assets/images/svgfile/menu/accountActive.svg'),
                        label: S.of(context).profile,
                      ),
                    ],
                    currentIndex: _settingCon.selectedIndex,
                    unselectedItemColor: Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor,

                    selectedItemColor: AppColor.mainColor,

                    onTap: _settingCon.onTap,
                  ),
            backgroundColor: AppColor.backgroundColor,
            body: [
              // Dashboard(),
              const MainDashboard(),

              const QrCodeScreen(),
              // LearningHome(),
              // SearchScreen(),
              const EventScreen(),
              //  Report(),
              //  BuySell(),
              // HomePage(),
              //  Directory(),
              // AboutCIC(),
              // NotificationScreen(),

              NewPeronalProfile(
                id: cusController.customer.value.customerId,
              )
              // MemberDetail(
              //   memberDetailAgrument: MemberDetailAgrument(
              //       id: cusController.customer.value.customerId,
              //       pageName: 'user',
              //       isNavigator: true),
              // ),

              //  ProfilePage(),
            ].elementAt(_settingCon.selectedIndex),
          ),
        );
      },
    );
  }
}
