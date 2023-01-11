import 'dart:async';

import 'package:cicgreenloan/configs/route_configuration/route.dart';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/configs/firebase_deeplink/deeplink_service.dart';
import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import '../../Utils/helper/color.dart';
import '../../Utils/pin_code_controller/set_pin_code_controller.dart';

import '../../generated/l10n.dart';
import '../../Utils/helper/app_pin_code.dart' as app_pin_code;
import '../investment_module/controller/investment_controller.dart';
import '../../widgets/custom_menu_holder.dart';

class PaymentSchedule extends StatefulWidget {
  final String? fromPage;
  final Widget? child;
  const PaymentSchedule({Key? key, this.fromPage, this.child})
      : super(key: key);
  @override
  State<PaymentSchedule> createState() => _PaymentScheduleState();
}

class _PaymentScheduleState extends State<PaymentSchedule> {
  final settingCon = Get.put(SettingController());
  final priceCon = Get.put(PriceController());
  bool isShowBottomBar = true;
  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    debugPrint("Location: $location");
    if (currentIndex == 3) {
      return 3;
    }
    if (settingCon.bottomMenuBarList.length == 4) {
      debugPrint('4 length');
      if (location.startsWith('/profile')) {
        debugPrint("Return Home Page");

        return 3;
      }
      if (location.startsWith('/event')) {
        return 2;
      }
      if (location.startsWith('/qr-screen')) {
        return 1;
      }
      if (location.startsWith('/')) {
        return 0;
      }
    }

    if (settingCon.bottomMenuBarList.length == 3) {
      if (location.startsWith('/profile')) {
        debugPrint("Return Home Page");
        return 2;
      }
      if (location.startsWith('/qr-screen')) {
        return 1;
      }
      if (location.startsWith('/')) {
        return 0;
      }
    }

    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    if (settingCon.bottomMenuBarList.length == 4) {
      debugPrint('index==$index');
      switch (index) {
        case 0:
          // settingCon.onCheckAuthentication();
          GoRouter.of(context).go(settingCon.bottomMenuBarList[0].route!);
          break;
        case 1:
          _settingCon.onHideBottomNavigationBar(true);
          GoRouter.of(context).go(settingCon.bottomMenuBarList[1].route!);
          break;
        case 2:
          // settingCon.onCheckAuthentication();
          GoRouter.of(context).go(settingCon.bottomMenuBarList[2].route!);
          break;
        case 3:
          debugPrint('Test Click Profile');
          // settingCon.onCheckAuthentication();
          // GoRouter.of(context).go(settingCon.bottomMenuBarList[3].route!);
          break;
      }
    }
    if (settingCon.bottomMenuBarList.length == 3) {
      switch (index) {
        case 0:
          // settingCon.onCheckAuthentication();
          GoRouter.of(context).go(settingCon.bottomMenuBarList[0].route!);
          break;
        case 1:
          _settingCon.onHideBottomNavigationBar(true);
          GoRouter.of(context).go(settingCon.bottomMenuBarList[1].route!);
          break;

        case 2:
          // settingCon.onCheckAuthentication();
          GoRouter.of(context).go(settingCon.bottomMenuBarList[2].route!);
          break;
      }
    }
  }

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
          // Navigator.pop(router.navigator.context);
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
  //
  Future<void> getUser() async {
    await userCon.getUser();
    await priceCon.onHideFeatureByUser(cusController.customer.value.id);
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    DynamicLinkService.initDynamicLinks();
    getUser();
    settingCon.fetchSlide();

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
    // fetchAppVersion();
    _userController.isLoginSuccess(true);
    // homeMenu = S.of(context).homeMenu;
    // notificationMenu = S.of(context).notificationMenu;
    // profileMenu = S.of(context).profile;
    super.initState();
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

  bool isLoadingAllSetting = false;
  int currentIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  GlobalKey containerKey = GlobalKey();
  Offset childOffset = const Offset(0, 0);
  Size? childSize;

  getOffset() {
    RenderObject? renderObject =
        containerKey.currentContext!.findRenderObject();

    Size size = (renderObject as RenderBox).size;
    Offset offset = (renderObject).localToGlobal(Offset.zero);
    setState(() {
      childOffset = Offset(offset.dx, offset.dy);
      childSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SettingController(),
      builder: (SettingController setting) {
        return DefaultSizeWeb(
          child: Stack(
            children: [
              Positioned.fill(
                child: Scaffold(
                  bottomNavigationBar: !setting.isHideBottomNavigation &&
                          settingCon.bottomMenuBarList.isNotEmpty
                      ? Container(
                          height: 90,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: setting.bottomMenuBarList
                                .asMap()
                                .entries
                                .map((navigation) {
                              if (navigation.key == 3) {
                                return CustomFocusedMenuHolder(
                                  animateMenuItems: false,
                                  menuBoxDecoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  blurBackgroundColor:
                                      const Color(0xffE1E1E1).withOpacity(0.5),
                                  blurSize: 5,
                                  openWithTap: true,
                                  menuItems: <CustomFocusedMenuItem>[
                                    CustomFocusedMenuItem(
                                        title: const Text("Profile"),
                                        trailingIcon: Image.asset(
                                          'assets/images/morePopUp/Profile.png',
                                          height: 20,
                                          width: 20,
                                        ),
                                        onPressed: () {
                                          GoRouter.of(context).go(settingCon
                                              .bottomMenuBarList[3].route!);
                                        }),
                                    CustomFocusedMenuItem(
                                        title: const Text("News"),
                                        trailingIcon: Image.asset(
                                          'assets/images/morePopUp/News.png',
                                          height: 20,
                                          width: 20,
                                        ),
                                        onPressed: () {}),
                                    CustomFocusedMenuItem(
                                        title: const Text("Learning"),
                                        trailingIcon: Image.asset(
                                          'assets/images/morePopUp/Learning.png',
                                          height: 20,
                                          width: 20,
                                        ),
                                        onPressed: () {
                                          GoRouter.of(context).go("/learning");
                                        }),
                                    CustomFocusedMenuItem(
                                        title: const Text("Directory"),
                                        trailingIcon: Image.asset(
                                          'assets/images/morePopUp/Directory.png',
                                          height: 20,
                                          width: 20,
                                        ),
                                        onPressed: () {
                                          GoRouter.of(context).go('/directory');
                                        }),
                                  ],
                                  onPressed: () {
                                    setState(() {
                                      currentIndex = navigation.key;
                                      debugPrint(
                                          'indx=${currentIndex == navigation.key}');
                                      _onItemTapped(currentIndex, context);
                                    });
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12, bottom: 4),
                                        child: SizedBox(
                                          width: 23,
                                          height: 23,
                                          // color: Colors.blue,
                                          child: _calculateSelectedIndex(
                                                      context) ==
                                                  navigation.key
                                              ? SvgPicture.network(
                                                  navigation.value.activeIcon!,
                                                  fit: BoxFit.cover,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                )
                                              : SvgPicture.network(
                                                  navigation.value.icon!,
                                                  fit: BoxFit.cover,
                                                  color:
                                                      const Color(0XFF848F92),
                                                ),
                                        ),
                                      ),
                                      Text(
                                        "${navigation.value.label}",
                                        style: TextStyle(
                                            color: _calculateSelectedIndex(
                                                        context) ==
                                                    navigation.key
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context)
                                                    .bottomNavigationBarTheme
                                                    .unselectedItemColor,
                                            fontSize: 12,
                                            fontFamily: "DM Sans",
                                            fontWeight:
                                                currentIndex == navigation.key
                                                    ? FontWeight.w700
                                                    : FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return InkWell(
                                  onTap: () async {
                                    debugPrint('idx=${navigation.key}');
                                    setState(() {
                                      currentIndex = navigation.key;
                                    });
                                    _onItemTapped(currentIndex, context);
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12, bottom: 4),
                                        child: SizedBox(
                                          width: 23,
                                          height: 23,
                                          // color: Colors.blue,
                                          child: _calculateSelectedIndex(
                                                      context) ==
                                                  navigation.key
                                              ? SvgPicture.network(
                                                  navigation.value.activeIcon!,
                                                  fit: BoxFit.cover,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                )
                                              : SvgPicture.network(
                                                  navigation.value.icon!,
                                                  fit: BoxFit.cover,
                                                  color:
                                                      const Color(0XFF848F92),
                                                ),
                                        ),
                                      ),
                                      Text(
                                        "${navigation.value.label}",
                                        style: TextStyle(
                                            color: _calculateSelectedIndex(
                                                        context) ==
                                                    navigation.key
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context)
                                                    .bottomNavigationBarTheme
                                                    .unselectedItemColor,
                                            fontSize: 12,
                                            fontFamily: "DM Sans",
                                            fontWeight: _calculateSelectedIndex(
                                                        context) ==
                                                    navigation.key
                                                ? FontWeight.w700
                                                : FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }).toList(),
                          ),
                        )

                      //  BottomNavigationBar(
                      //   type: BottomNavigationBarType.fixed,
                      //   selectedFontSize: 12,
                      //   unselectedFontSize: 12,
                      //   //        selectedLabelStyle: TextStyle(color: Colors.white),
                      //   // type: BottomNavigationBarType.fixed,

                      //   // items: <BottomNavigationBarItem>[
                      //   //   BottomNavigationBarItem(
                      //   //     icon: SvgPicture.asset(
                      //   //       'assets/images/svgfile/menu/home.svg',
                      //   //       color: const Color(0XFF848F92),
                      //   //     ),
                      //   //     label: S.of(context).homeMenu,
                      //   //     activeIcon: SvgPicture.asset(
                      //   //       'assets/images/svgfile/menu/HomeActiveIcon.svg',
                      //   //       color: Theme.of(context).primaryColor,
                      //   //     ),
                      //   //   ),
                      //   //   BottomNavigationBarItem(
                      //   //     icon: SvgPicture.asset(
                      //   //         'assets/images/svgfile/menu/qrcodeInactive.svg',
                      //   //         color: const Color(0XFF848F92)),
                      //   //     activeIcon: SvgPicture.asset(
                      //   //       'assets/images/svgfile/menu/qrCodeActive.svg',
                      //   //       color: Theme.of(context).primaryColor,
                      //   //     ),
                      //   //     label: S.of(context).qrCode,
                      //   //   ),
                      //   //   BottomNavigationBarItem(
                      //   //       icon: SvgPicture.asset(
                      //   //           'assets/images/svgfile/menu/eventInactive.svg'),
                      //   //       activeIcon: SvgPicture.asset(
                      //   //         'assets/images/svgfile/menu/eventActive.svg',
                      //   //         color: Theme.of(context).primaryColor,
                      //   //       ),
                      //   //       label: S.of(context).event),
                      //   //   BottomNavigationBarItem(
                      //   //     icon: SvgPicture.asset(
                      //   //         'assets/images/svgfile/menu/account.svg',
                      //   //         color: const Color(0XFF848F92)),
                      //   //     activeIcon: SvgPicture.asset(
                      //   //       'assets/images/svgfile/menu/accountActive.svg',
                      //   //       color: Theme.of(context).primaryColor,
                      //   //     ),
                      //   //     label: S.of(context).profile,
                      //   //   ),
                      //   // ],
                      //   items: setting.bottomMenuBarList
                      //       .asMap()
                      //       .entries
                      //       .map((navigation) {
                      //     return BottomNavigationBarItem(
                      //       icon: SvgPicture.network(
                      //         navigation.value.icon!,
                      //         color: const Color(0XFF848F92),
                      //       ),
                      //       label: navigation.value.label,
                      //       activeIcon: SvgPicture.network(
                      //         navigation.value.activeIcon!,
                      //         color: Theme.of(context).primaryColor,
                      //       ),
                      //     );
                      //   }).toList(),
                      //   // currentIndex: _settingCon.selectedIndex,
                      //   unselectedItemColor: Theme.of(context)
                      //       .bottomNavigationBarTheme
                      //       .unselectedItemColor,
                      //   selectedItemColor: Theme.of(context).primaryColor,

                      //   // onTap: _settingCon.onTap,
                      //   currentIndex: _calculateSelectedIndex(context),

                      //   onTap: (int idx) => _onItemTapped(idx, context),
                      // )
                      : null,
                  backgroundColor: AppColor.backgroundColor,
                  body: widget.child,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
