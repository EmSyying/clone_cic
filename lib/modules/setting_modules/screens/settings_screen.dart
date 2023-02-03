// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/configs/firebase_deeplink/deeplink_service.dart';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/Utils/function/set_current_user.dart';
import 'package:cicgreenloan/Utils/pop_up_alert/comfirm_alert.dart';
import 'package:cicgreenloan/Utils/web_view/web_view.dart';
import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/core/auth/login.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/modules/setting_modules/controllers/setting_controller.dart';
import 'package:cicgreenloan/Utils/pop_up_alert/custom_loading.dart';
import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/modules/member_directory/models/user.dart';
import 'package:cicgreenloan/modules/setting_modules/screens/sub_setting_screen/about_section.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Utils/form_builder/custom_listile.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../Utils/helper/custom_appbar.dart';
import '../../../core/auth/auth_controller/auth_controller.dart';
import '../../../core/auth/verify_set_password.dart';
import '../../../core/flavor/flavor_configuration.dart';
import '../../member_directory/models/personal_profile_model.dart/personal_profile_model.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final customerController = Get.put(CustomerController());
  String defaultLang = 'English';
  final _con = Get.put(SettingAppController());
  final _settingCon = Get.put(SettingController());
  final _user = Get.put(CustomerController());
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  final _conSetting = Get.put(SettingController());
  final _memberCon = Get.put(MemberController());
  final _authController = Get.put(AuthController());

  bool? isDarkMode;
  bool isOnNotification = false;
  bool? isOnFingerPrint = false;
  bool? isFaceID = false;
  String? biotricType = '';

  dynamic preferences;
  bool _isLoading = false;
  bool isAuthen = false;
  getBiotricType() async {
    await LocalData.getBiotricType('biotricType').then((value) {
      setState(() {
        biotricType = value;
        debugPrint("BiotricType: $biotricType");
      });
    });
  }

  final LocalAuthentication auth = LocalAuthentication();
  bool authenticated = false;
  Future<void> _authenticate() async {
    authenticated = false;
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        if (availableBiometrics.contains(BiometricType.fingerprint)) {
          await LocalData.storeBiotricType('biotricType', 'fingerPrint');
        }
      } else {
        if (availableBiometrics.contains(BiometricType.face)) {
          await LocalData.storeBiotricType('biotricType', 'faceId');
        } else {
          await LocalData.storeBiotricType('biotricType', 'touchId');
        }
      }

      try {
        _conSetting.isAuthenticating.value = true;
        _conSetting.authorized.value = 'Authenticating';

        authenticated = await auth.authenticate(
          localizedReason: 'Scan your fingerprint to authenticate',
        );

        _conSetting.isAuthenticating.value = false;
        _conSetting.authorized.value = 'Authenticating';
      } on PlatformException {
        debugPrint("error");
      }
    }
  }

  isAuthenthication() async {
    if (!kIsWeb) {
      await LocalData.getAuthenValue('authen').then((value) {
        setState(() {
          isFaceID = value;
          isOnFingerPrint = value;
        });
      });
    }
  }

  onGetNotificationEnable() async {
    await customerController.getUser().then((value) {});
  }

  var map = {
    "parent": {
      "type": "Hello",
    }
  };

  @override
  void initState() {
    getBiotricType();
    isAuthenthication();
    // isEnableNotification();
    // onGetNotificationEnable();
    _settingCon.fetchTechnicalSupport();
    setState(() {
      isOnNotification =
          customerController.customer.value.enableNotification ?? false;
    });
    _settingCon.fetchAppVersion(
        userType:
            customerController.customer.value.memberType![0].toLowerCase());
    _con.getLocale();

    super.initState();
  }

  onShowDialog(BuildContext context) {
    kIsWeb
        ? showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                insetPadding: const EdgeInsets.symmetric(horizontal: 18),
                titlePadding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                title: const Text(
                  "Confirmation",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppin',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // contentPadding: EdgeInsets.all(0),
                content: const Text('Are you sure, you want to log out ?'),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 10.0, right: 10.0, bottom: 10.0, top: 10.0),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 14,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      _authController.clearAuth();
                      _user.customer.value = User();
                      _memberCon.personalProfile.value = PersonalProfile();
                      Navigator.pop(context);
                      removeUser('current_user');
                      _user.isLoginSuccess(false);
                      await LocalData.removePINcode('setPIN');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          right: 10.0, bottom: 10.0, top: 10.0),
                      child: const Text(
                        'Log Out',
                        style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 14,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  // Raisedbutton(
                  //   onPressed: () async {
                  //     Navigator.pop(context);
                  //     removeUser('current_user');
                  //     await LocalData.removePINcode('setPIN');
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => LoginScreen()));
                  //   },
                  //   child: Text('Log Out'),
                  //   shape: RoundedRectangleBorder(),
                  // ),
                ],
              );
            },
          )
        : Platform.isIOS
            ? showCupertinoDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: CupertinoAlertDialog(
                      title: const Text(
                        'Confirmation',
                      ),
                      content: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Are you sure, you want to log out ?'),
                      ),
                      actions: [
                        CupertinoButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            context.pop();
                          },
                        ),
                        CupertinoButton(
                          child: const Text('Log Out'),
                          onPressed: () async {
                            _authController.clearAuth();
                            _user.customer.value = User();
                            _memberCon.personalProfile.value =
                                PersonalProfile();

                            removeUser('current_user');
                            _user.isLoginSuccess(false);

                            await LocalData.removePINcode('setPIN');
                            context.go('/login');
                            context.pop();
                          },
                        ),
                      ],
                    ),
                  );
                })
            : showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    insetPadding: const EdgeInsets.symmetric(horizontal: 18),
                    titlePadding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 20.0),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 0.0),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    title: const Text(
                      "Confirmation",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppin',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    // contentPadding: EdgeInsets.all(0),
                    content: const Text('Are you sure, you want to log out ?'),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 10.0, bottom: 10.0, top: 10.0),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 14,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          _authController.clearAuth();
                          _user.customer.value = User();
                          _memberCon.personalProfile.value = PersonalProfile();

                          removeUser('current_user');
                          _user.isLoginSuccess(false);

                          await LocalData.removePINcode('setPIN');
                          context.go('/login');
                          context.pop();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 10.0, bottom: 10.0, top: 10.0),
                          child: const Text(
                            'Log Out',
                            style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 14,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      // Raisedbutton(
                      //   onPressed: () async {
                      //     Navigator.pop(context);
                      //     removeUser('current_user');
                      //     await LocalData.removePINcode('setPIN');
                      //     Navigator.push(context,
                      //         MaterialPageRoute(builder: (context) => LoginScreen()));
                      //   },
                      //   child: Text('Log Out'),
                      //   shape: RoundedRectangleBorder(),
                      // ),
                    ],
                  );
                },
              );
  }

  changeTheme(bool darkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    preferences = prefs.setBool('isDark', darkMode);
  }

  getThem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool('isDark');
  }

  changeLanguage(String localeCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', localeCode);
  }

  getLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      if (prefs.getString('language') != null) {
        S.load(Locale((prefs.getString('language'))!));
      } else {
        S.load(const Locale('en'));
      }
      if (prefs.getString('language') == "en") {
        defaultLang = "English";
      } else {
        defaultLang = "ភាសាខ្មែរ";
      }
    });
  }

  requestOtp() async {
    setState(() {
      _isLoading = true;
    });
    _isLoading == true ? showLoadingDialog(context) : Container();

    var token = await LocalData.getCurrentUser();
    String url = '${FlavorConfig.instance.values!.apiBaseUrl}request-otp';
    try {
      final response = await http.post(Uri.parse(url), headers: {
        'Accept': 'applicatio/json',
        'Authorization': 'Bearer $token',
      }, body: {
        'phone': _user.customer.value.phone
      });
      if (response.statusCode == 200) {
        setState(() {
          _isLoading = false;
        });
        context.pop();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifySetPassword(
              isForgetPassword: false,
              phone: _user.customer.value.phone,
            ),
          ),
        );
      } else {
        _isLoading = false;
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  onChooseLanguage(BuildContext context) {
    return kIsWeb
        ? showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: 120,
                width: double.infinity,
                child: Column(
                  children: [
                    TextButton(
                      child: const Text('ភាសាខ្មែរ'),
                      onPressed: () {
                        setState(() {
                          defaultLang = 'ភាសាខ្មែរ';
                          changeLanguage('kh');
                          getLocale();
                        });

                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: const Text('English'),
                      onPressed: () {
                        setState(() {
                          defaultLang = 'English';
                          changeLanguage('en');
                          getLocale();
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            })
        : Platform.isIOS
            ? showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text('Choose Lanuage'),
                    content: Column(
                      children: [
                        CupertinoButton(
                          child: const Text('ភាសាខ្មែរ'),
                          onPressed: () {
                            setState(() {
                              defaultLang = 'ភាសាខ្មែរ';
                              _con.changeLanguage('kh');
                              _con.getLocale();
                            });
                            Navigator.pop(context);
                          },
                        ),
                        CupertinoButton(
                          child: const Text('English'),
                          onPressed: () {
                            setState(() {
                              defaultLang = 'English';
                              _con.changeLanguage('en');
                              _con.getLocale();
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              )
            : showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: Column(
                      children: [
                        TextButton(
                          child: const Text('ភាសាខ្មែរ'),
                          onPressed: () {
                            setState(() {
                              defaultLang = 'ភាសាខ្មែរ';
                              changeLanguage('kh');
                              getLocale();
                            });

                            Navigator.pop(context);
                          },
                        ),
                        TextButton(
                          child: const Text('English'),
                          onPressed: () {
                            setState(() {
                              defaultLang = 'English';
                              changeLanguage('en');
                              getLocale();
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultSizeWeb(
      child: Scaffold(
        appBar: CustomAppBar(
          onTap: () async {
            final url = await DynamicLinkService.createDynamicLink(
                path: 'event/2', isShort: true);
            debugPrint("Event: $url");
          },
          isLeading: true,
          isLogo: false,
          context: context,
          elevation: 1.0,
          title: S.of(context).setting,
        ),
        body: RefreshIndicator(
          key: refreshKey,
          onRefresh: onRefresh,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 26, bottom: 10, right: 20, left: 20),
                        child: Text(
                          'App System',
                          style: TextStyle(
                              // color: Colors.black,
                              fontFamily: 'Poppin',
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      UserListile(
                        icon: "assets/images/svgfile/notification.svg",
                        label: S.of(context).notificationMenu,
                        onTap: () {},
                        trailing: kIsWeb
                            ? Switch(
                                onChanged: (value) async {
                                  await LocalData.storeNotification(
                                      'notification', value);

                                  await LocalData.getNotificationKey(
                                          'notification')
                                      .then((value) {
                                    setState(() {
                                      isOnNotification = value;
                                    });
                                  });
                                  await _settingCon
                                      .onSwitchNotificationSetting();
                                  await customerController.getUser();
                                },
                                value: isOnNotification,
                              )
                            : Platform.isAndroid
                                ? Switch(
                                    onChanged: (value) async {
                                      await LocalData.storeNotification(
                                          'notification', value);

                                      await LocalData.getNotificationKey(
                                              'notification')
                                          .then((value) {
                                        setState(() {
                                          isOnNotification = value;
                                        });
                                      });
                                      await _settingCon
                                          .onSwitchNotificationSetting();
                                      await customerController.getUser();
                                    },
                                    value: isOnNotification,
                                  )
                                : CupertinoSwitch(
                                    onChanged: (value) async {
                                      // AppSettings.openNotificationSettings();
                                      await LocalData.storeNotification(
                                          'notification', value);

                                      await LocalData.getNotificationKey(
                                              'notification')
                                          .then((value) {
                                        setState(() {
                                          isOnNotification = value;
                                        });
                                      });
                                      await _settingCon
                                          .onSwitchNotificationSetting();
                                      await customerController.getUser();
                                    },
                                    value: isOnNotification,
                                  ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.only(bottom: 10, right: 20, left: 20),
                        child: Text(
                          'Sign in & Security',
                          style: TextStyle(
                              // color: Colors.black,
                              fontFamily: 'Poppin',
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      UserListile(
                        icon: "assets/images/svgfile/change-password.svg",
                        label: S.of(context).changePassword,
                        onTap: () {
                          onShowConfirmAlert(
                              title: 'Confirmation',
                              content:
                                  'Are you sure, you want to change password?',
                              context: context,
                              onPressed: () {
                                context.pop();
                                requestOtp();
                              });
                        },
                      ),
                      Container(
                        color: Theme.of(context).cardColor,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                      ),
                      if (biotricType == 'touchId' ||
                          biotricType == 'fingerPrint')
                        UserListile(
                          icon: "assets/images/svgfile/Fingerprint.svg",
                          label: S.of(context).useFingerPrint,
                          onTap: () {},
                          trailing: kIsWeb
                              ? Switch(
                                  onChanged: (value1) async {
                                    _authenticate().then((value) {
                                      if (authenticated) {
                                        LocalData.storeAuthenthicationKey(
                                            'authen', value1);
                                        LocalData.getAuthenValue('authen')
                                            .then((isAuthen) {
                                          isOnFingerPrint = isAuthen;
                                        });
                                        // if (!isOnFingerPrint)
                                        setState(() {});
                                      }
                                    });
                                    setState(() {});
                                  },
                                  value: isOnFingerPrint!,
                                )
                              : Platform.isAndroid
                                  ? Switch(
                                      onChanged: (value1) async {
                                        _authenticate().then((value) {
                                          if (authenticated) {
                                            debugPrint('This work');
                                            LocalData.storeAuthenthicationKey(
                                                'authen', value1);
                                            LocalData.getAuthenValue('authen')
                                                .then((isAuthen) {
                                              isOnFingerPrint = isAuthen;
                                            });
                                            // if (!isOnFingerPrint)
                                            setState(() {});
                                          }
                                        });
                                        setState(() {});
                                      },
                                      value: isOnFingerPrint!,
                                    )
                                  : CupertinoSwitch(
                                      onChanged: (value1) async {
                                        _authenticate().then((value) {
                                          if (authenticated) {
                                            debugPrint('This work');
                                            LocalData.storeAuthenthicationKey(
                                                'authen', value1);
                                            LocalData.getAuthenValue('authen')
                                                .then((isAuthen) {
                                              isOnFingerPrint = isAuthen;
                                            });
                                            // if (!isOnFingerPrint)
                                            setState(() {});
                                          }
                                        });
                                        setState(() {});
                                      },
                                      value: isOnFingerPrint!,
                                    ),
                        ),
                      if (biotricType == 'touchId' ||
                          biotricType == 'fingerPrint')
                        Container(
                          color: Theme.of(context).cardColor,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        ),
                      if (biotricType == 'faceId')
                        UserListile(
                          icon: "assets/images/svgfile/scan-face.svg",
                          label: S.of(context).useFaceIDtoSignIn,
                          onTap: () {},
                          trailing: kIsWeb
                              ? Switch(
                                  onChanged: (value) async {
                                    await LocalData.storeAuthenthicationKey(
                                        'authen', value);

                                    LocalData.getAuthenValue('authen')
                                        .then((isAuthen) {
                                      setState(() {
                                        isFaceID = isAuthen;
                                      });
                                    });
                                    if (!isFaceID!) _authenticate();
                                  },
                                  value: isFaceID!,
                                )
                              : Platform.isAndroid
                                  ? Switch(
                                      onChanged: (value) async {
                                        await LocalData.storeAuthenthicationKey(
                                            'authen', value);

                                        LocalData.getAuthenValue('authen')
                                            .then((isAuthen) {
                                          setState(() {
                                            isFaceID = isAuthen;
                                          });
                                        });
                                        if (!isFaceID!) _authenticate();
                                      },
                                      value: isFaceID!,
                                    )
                                  : CupertinoSwitch(
                                      onChanged: (value) async {
                                        await LocalData.storeAuthenthicationKey(
                                            'authen', value);
                                        LocalData.getAuthenValue('authen')
                                            .then((isAuthen) {
                                          setState(() {
                                            isFaceID = isAuthen;
                                          });
                                        });
                                        if (!isFaceID!) _authenticate();
                                      },
                                      value: isFaceID!,
                                    ),
                        ),
                      if (biotricType == 'faceId')
                        Container(
                          color: Theme.of(context).cardColor,
                          child: const Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        ),
                      UserListile(
                        icon: "assets/images/svgfile/change-pin.svg",
                        label: customerController.customer.value.pinCode != ""
                            ? 'Change PIN'
                            : 'Set PIN',
                        onTap: () {
                          onShowConfirmAlert(
                            title: 'Confirmation',
                            content:
                                'Are you sure, you want to change PIN Code?',
                            context: context,
                            onPressed: () {
                              context.pop();

                              context.go('/verify-pin-code?status=Current');

                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const VerifyPINCode(
                              //       status: 'Current',
                              //     ),
                              //   ),
                              // );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.only(bottom: 10, right: 20, left: 20),
                        child: Text(
                          'Support',
                          style: TextStyle(
                              // color: Colors.black,
                              fontFamily: 'Poppin',
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      UserListile(
                        icon: "assets/images/svgfile/privacy-policy.svg",
                        label: S.of(context).privacyPolicy,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewWebsite(
                                title: S.of(context).privacy,
                                url:
                                    'https://cic-holding.com/cic-mobile-app-privacy-policy',
                              ),
                            ),
                          );
                        },
                      ),
                      Container(
                        color: Theme.of(context).cardColor,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                      ),
                      UserListile(
                        icon: "assets/images/svgfile/term-condition.svg",
                        label: S.of(context).termsCondition,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewWebsite(
                                        title: S.of(context).termsCondition,
                                        url:
                                            'https://cic-association.com/other-page/?page-id=133',
                                      )));
                        },
                      ),
                      Container(
                        color: Theme.of(context).cardColor,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                      ),
                      UserListile(
                        icon: "assets/images/svgfile/about-cic.svg",
                        label: S.of(context).aboutCiC,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AboutSection(),
                            ),
                          );
                        },
                      ),
                      Container(
                        color: Theme.of(context).cardColor,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                      ),
                      UserListile(
                        icon: "assets/images/svgfile/cic-app-manual.svg",
                        label: "CiC App Manual",
                        onTap: () {
                          context.go('/profile/setting/cic-app-manual');
                        },
                      ),
                      Container(
                        color: Theme.of(context).cardColor,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                      ),
                      UserListile(
                        icon: "assets/images/svgfile/technical_support.svg",
                        label: "Technical Support",
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return CupertinoActionSheet(
                                actions: [
                                  CupertinoActionSheetAction(
                                    onPressed: () async {
                                      await launchUrl(
                                        Uri.parse(
                                            '${_settingCon.technicalSupport.value.link}'),
                                        mode: LaunchMode.externalApplication,
                                      );
                                    },
                                    child: Text(
                                      "Chat Telegram",
                                      style: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 16,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  CupertinoActionSheetAction(
                                    onPressed: () async {
                                      await launchUrl(Uri.parse(
                                        'tel://${_settingCon.technicalSupport.value.phone}',
                                      ));
                                    },
                                    child: Text(
                                      '${_settingCon.technicalSupport.value.phone}',
                                      style: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 16,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                                cancelButton: CupertinoActionSheetAction(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 16,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Obx(
                    () => Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        UserListile(
                          isMainColor: true,
                          icon: "assets/images/svgfile/log-out.svg",
                          labelColor: Colors.red,
                          label: S.of(context).logoutbutton,
                          onTap: () {
                            // await LocalData.removePINcode('setPIN');
                            onShowDialog(context);
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        !_settingCon.isLoadingAboutCiC.value
                            ? GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         const PrivilegeScreen(),
                                  //   ),
                                  // );
                                  context.push('/privilege/all-stores');
                                },
                                child: CachedNetworkImage(
                                  imageUrl: _settingCon
                                      .appSettingVersion.value.applicationLogo!,
                                  width: 100,
                                  height: 100,
                                ),
                              )
                            : Container(),
                        !_settingCon.isLoadingAboutCiC.value
                            ? Text(
                                'Version ${_settingCon.appSettingVersion.value.applicationNewVersion}',
                                style: const TextStyle(
                                    fontFamily: 'Poppin', fontSize: 12),
                              )
                            : Container(),
                        const SizedBox(
                          height: 5,
                        ),
                        !_settingCon.isLoadingAboutCiC.value
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  _settingCon
                                      .appSettingVersion.value.applicationName!,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontFamily: 'Poppin',
                                      fontSize: 12,
                                      height: 1.5),
                                ),
                              )
                            : Container(),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onRefresh() async {
    await _settingCon.fetchAppVersion();
  }
}
