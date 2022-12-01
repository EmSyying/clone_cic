// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:cicgreenloan/Utils/pin_code_controller/set_pin_code_controller.dart';

import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/configs/firebase_deeplink/deeplink_service.dart';
import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/Utils/app_settings/models/settings.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:passcode_screen/passcode_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';
import 'Utils/function/notification_helper.dart';
import 'Utils/helper/color.dart';
import 'Utils/helper/local_storage.dart';
import 'Utils/option_controller/option_controller.dart';
// import 'configs/auto_route/auto_route.gr.dart';
import 'configs/route_configuration/route.dart';
import 'generated/l10n.dart';
import '../../Utils/app_settings/controllers/appsetting_controller.dart';
import '../../Utils/helper/app_pin_code.dart' as app_pin_code;

final optionCon = Get.put(DocumentCategory());
final settingCon = Get.put(SettingController());
ValueNotifier<bool> isLogin = ValueNotifier(false);

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await LocalStorage.init();
  // WidgetsBinding.instance.addPostFrameCallback((_) => initPlugin());
  // setPathUrlStrategy();
  // await NotificationHelper.initial();
  // await Firebase.initializeApp();
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle.light.copyWith(
  //     systemNavigationBarIconBrightness: Brightness.dark,
  //   ),
  // );
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // await GlobalConfiguration().loadFromAsset("app_settings");

  // runApp(
  //   MyApp(),
  // );
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await LocalStorage.init();
    await Firebase.initializeApp();

    setPathUrlStrategy();
    await settingCon.fetchAppSetting();
    await NotificationHelper.initial();
    optionCon.fetchAllOptions();
    await LocalData.getCurrentUser().then(
      (value) {
        if (value != null) {
          isLogin.value = true;
          isLogin.notifyListeners();
        } else {
          isLogin.value = false;
          isLogin.notifyListeners();
        }
      },
    );
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    runApp(const MyApp());
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

// ignore: must_be_immutable

bool isLoginSuccess = false;

class MyApp extends StatefulWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  const MyApp({Key? key}) : super(key: key);

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Setting? setting;

  String? token;
  void onNavigator() async {
    try {
      await LocalData.getCurrentUser().then((value) {
        if (value != null) {
          setState(() {
            isLoginSuccess = true;
          });

          // Future.delayed(const Duration(seconds: 3), () {

          //   // context.go('/');
          // });
        } else {
          setState(() {
            isLoginSuccess = false;
          });

          // Future.delayed(const Duration(seconds: 3), () {

          //   // Navigator.push(context,
          //   //     MaterialPageRoute(builder: (context) => const StartupSlide()));
          // });
        }
      });
      // await _googleMapCon.determinePosition().then((value) {
      //   _googleMapCon.latitute = value.latitude;
      //   _googleMapCon.longtitute = value.longitude;

      //   _googleMapCon.update();
      // });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  final isLocal = true;

  final _con = Get.put(SettingController());

  String currentLocale = '';

  Future<void> getCurrentLocale() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    currentLocale = pref.getString('locale')!;
  }

  bool isDisableAutoDarkMode = false;

  // UserController _userController = UserController();
  getLocalData() async {}

  final customerController = Get.put(CustomerController());

  final timeout = const Duration(minutes: 1);

  final ms = const Duration(milliseconds: 1);

  Map<String, dynamic> deviceData = <String, dynamic>{};

  Future<void> initPlatformState() async {
    Map<String, dynamic> deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        deviceData =
            _readAndroidBuildData(await MyApp.deviceInfoPlugin.androidInfo);
        // var versionName = deviceData['systemName'];
        // if (versionName == 'OxygenOS') {
        //   _con.isAutoDarkMode.value = true;
        // }
      } else if (kIsWeb) {
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await MyApp.deviceInfoPlugin.iosInfo);
        // var versionName = deviceData['systemName'];
        // if (versionName == 'iOS') {
        //   _con.isAutoDarkMode.value = true;
        // }
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    deviceData = deviceData;
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Timer timer = Timer(const Duration(minutes: 1), () {});

  // String storePinCode;
  final setPINCodeController = Get.put(SetPINCodeController());

  // var pinCode;
  final LocalAuthentication auth = LocalAuthentication();

  Future<void> checkBiometrics() async {
    final canCheckBiometrics = false.obs;
    try {
      canCheckBiometrics.value = await auth.canCheckBiometrics;
    } on PlatformException {
      debugPrint("error");
    }

    _con.canCheckBiometrics.value = canCheckBiometrics.value;
  }

  Future<void> getAvailableBiometrics() async {
    List<BiometricType>? availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      debugPrint("$e");
    }

    _con.availableBiometrics.value = availableBiometrics!;
  }

  String? storePasscode;

  _onPasscodeEntered(String enteredPasscode) {
    bool isValid = storePasscode == enteredPasscode;

    _verificationNotifier.add(isValid);

    setPINCodeController.submitPINCode(pinCode: enteredPasscode);
  }

  cancelButton() {
    Navigator.maybePop(Get.context!);
  }

  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  bool isAuthenticated = false;

  _showLockScreen() {
    Navigator.push(
      Get.context!,
      PageRouteBuilder(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) {
            return DefaultSizeWeb(
              child: WillPopScope(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5.0,
                      sigmaY: 5.0,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PasscodeScreen(
                          title: const Text(
                            'Enter Passcode',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 28),
                          ),
                          passwordEnteredCallback: _onPasscodeEntered,
                          cancelButton: const Text(''),
                          deleteButton: const Text(
                            'Delete',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            semanticsLabel: 'Delete',
                          ),
                          shouldTriggerVerification:
                              _verificationNotifier.stream,
                          backgroundColor:
                              Theme.of(context).primaryColor.withOpacity(0.98),
                          passwordDigits: 4,
                        ),
                        Obx(
                          () => setPINCodeController.isLoading.value
                              ? Material(
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Container(
                                        padding: const EdgeInsets.all(30),
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(1.0, 0.0),
                                                blurRadius: 6)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        height: 100,
                                        width: 100,
                                        child:
                                            const CircularProgressIndicator()),
                                  ),
                                )
                              : Container(),
                        ),
                        Obx(
                          () => setPINCodeController.isInvalidePin.value
                              ? Material(
                                  color: Colors.transparent,
                                  child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(1.0, 0.0),
                                                blurRadius: 6,
                                                color: Colors.black26)
                                          ]),
                                      height: 100,
                                      padding: const EdgeInsets.all(20),
                                      margin: const EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          const Text(
                                              'Invalid PIN Code, Please retry.'),
                                          Row(
                                            children: [
                                              const Spacer(),
                                              GestureDetector(
                                                onTap: () {
                                                  setPINCodeController
                                                      .isInvalidePin
                                                      .value = false;
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20, top: 10),
                                                  child: Text(
                                                    'OK',
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                )
                              : Container(),
                        ),
                        Obx(
                          () => setPINCodeController.isblock.value
                              ? Material(
                                  color: Colors.transparent,
                                  child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                                offset: Offset(1.0, 0.0),
                                                blurRadius: 6,
                                                color: Colors.black26)
                                          ]),
                                      height: 140,
                                      padding: const EdgeInsets.all(20),
                                      margin: const EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(setPINCodeController
                                              .message.value),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Text(
                                                'Please contact to CiC team: ${setPINCodeController.contact.value}'),
                                          ),

                                          // Row(
                                          //   children: [
                                          //     Spacer(),
                                          //     GestureDetector(
                                          //       onTap: () {
                                          //         setPINCodeController.isblock.value =
                                          //             false;
                                          //       },
                                          //       child: Padding(
                                          //         padding: const EdgeInsets.only(
                                          //             left: 20, top: 10),
                                          //         child: Text(
                                          //           'OK',
                                          //           style: TextStyle(
                                          //               color:
                                          //                   Theme.of(context).primaryColor),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ],
                                          // )
                                        ],
                                      )),
                                )
                              : Container(),
                        ),
                      ],
                    ),
                  ),
                  onWillPop: () async => false),
            );
          }),
    );
  }

  Future<void> storeBiotricType() async {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    if (Platform.isAndroid) {
      if (availableBiometrics.contains(BiometricType.strong) ||
          availableBiometrics.contains(BiometricType.weak) ||
          availableBiometrics.contains(BiometricType.fingerprint)) {
        await LocalData.storeBiotricType('biotricType', 'fingerPrint');
      }
    } else if (kIsWeb) {
    } else {
      if (availableBiometrics.contains(BiometricType.face)) {
        await LocalData.storeBiotricType('biotricType', 'faceId');
      } else {
        await LocalData.storeBiotricType('biotricType', 'touchId');
      }
    }
  }

  Future<void> _authenticate() async {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    if (Platform.isAndroid) {
      if (availableBiometrics.contains(BiometricType.fingerprint)) {
        await LocalData.storeBiotricType('biotricType', 'fingerPrint');
      }
    } else if (kIsWeb) {
    } else {
      if (availableBiometrics.contains(BiometricType.face)) {
        await LocalData.storeBiotricType('biotricType', 'faceId');
      } else {
        await LocalData.storeBiotricType('biotricType', 'touchId');
      }
    }
    bool authenticated = false;
    try {
      _con.isAuthenticating.value = true;
      _con.authorized.value = 'Authenticating';

      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
      );
      if (authenticated) {
        setPinCon.isLogin(true);
        Navigator.pop(router.navigator!.context);
      }

      _con.isAuthenticating.value = false;
      _con.authorized.value = 'Authenticating';
    } on PlatformException {
      debugPrint("error");
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';

    _con.authorized.value = message;
  }

  void cancelAuthentication() {
    auth.stopAuthentication();
  }

  bool isUserLogin = false;

  checkUserLogin() async {
    isUserLogin = await LocalData.isUserLogin('userLogin');
  }

  Future<void> initAppTracking() async {
    final TrackingStatus status =
        await AppTrackingTransparency.trackingAuthorizationStatus;

    // If the system can show an authorization request dialog
    if (status == TrackingStatus.notDetermined) {
      // Show a custom explainer dialog before the system dialog

      // Wait for dialog popping animation
      await Future.delayed(const Duration(milliseconds: 200));
      // Request system's tracking authorization dialog
      final TrackingStatus status =
          await AppTrackingTransparency.requestTrackingAuthorization();
      debugPrint("Tracking status:$status");
    }

    final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
    debugPrint("UUID:$uuid");
  }

  final settingCon = Get.put(SettingController());

  @override
  void initState() {
    onNavigator();
    initAppTracking();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DynamicLinkService.initDynamicLinks(context);

    storeBiotricType();
    getLocalData();
    storeBiotricType();
    // getPinCode();
    initPlatformState();

    return ConnectivityAppWrapper(
      app: GetBuilder<SettingController>(
        init: SettingController(),
        initState: (_) {
          settingCon.onCheckAuthentication();
        },
        builder: (controller) {
          return Listener(
            onPointerDown: (tapdown) {
              // debugPrint(
              //     'Is Enable Pin Code: ${controller.cicAppSetting.enablePinCode}');
              // FocusScope.of(context).requestFocus(FocusNode());
              LocalData.showAppTou('appTour').then((value) {});

              if (controller.cicAppSetting.enablePinCode!) {
                if (customerController.isLoginSuccess.value) {
                  LocalData.showAppTou('appTour').then(
                    (value) {
                      if (value) {
                        app_pin_code.timer.cancel();
                        app_pin_code.timer = app_pin_code.startTimeout();
                      }
                    },
                  );
                }
              }
            },
            child: GetMaterialApp.router(
              routerDelegate: router.routerDelegate,
              routeInformationParser: router.routeInformationParser,
              routeInformationProvider: router.routeInformationProvider,
              localizationsDelegates: const [
                S.delegate,
                CountryLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              builder: (context, child) {
                return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child!);
              },
              supportedLocales: S.delegate.supportedLocales,
              title: 'CIC',

              // navigatorObservers: <NavigatorObserver>[observer],

              theme: ThemeData(
                brightness: Brightness.light,
                backgroundColor: AppColor.mainColor,
                primaryColor: AppColor.mainColor,
                secondaryHeaderColor: AppColor.secondaryColor,
                cardColor: Colors.white,
                appBarTheme: AppBarTheme(
                  backgroundColor: AppColor.mainColor,
                  centerTitle: false,
                  titleTextStyle:
                      Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    unselectedItemColor: const Color(0XFF848F92),
                    selectedItemColor: Theme.of(context).primaryColor),
                textTheme: TextTheme(
                  //appbar text
                  headline6: const TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  //catatagory text
                  caption: const TextStyle(
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                  headline5: const TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 12,
                    color: Color(0xff404040),
                  ),

                  headline3: const TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 14,
                      color: AppColor.mainColor,
                      fontWeight: FontWeight.w600),
                  headline1: isLocal
                      ? const TextStyle(
                          fontFamily: 'KhBattambang',
                          fontSize: 27,
                          color: AppColor.mainColor,
                        )
                      : const TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 27,
                          color: AppColor.mainColor,
                        ),
                  bodyText2: const TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),

                  subtitle2: const TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),

                  subtitle1: const TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500),
                  headline2: const TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  headline4: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'DMSans',
                  ),

                  bodyText1: const TextStyle(
                      fontFamily: 'DMSans', fontSize: 12, color: Colors.black),
                  button: const TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                colorScheme: ColorScheme.fromSwatch()
                    .copyWith(secondary: AppColor.mainColor),
                textSelectionTheme: const TextSelectionThemeData(
                    selectionColor: AppColor.mainColor),
              ),

              // darkTheme: !_con.isAutoDarkMode.value
              //     ? null
              //     : ThemeData.dark().copyWith(
              //         backgroundColor: Color(0xffDEE8E9).withOpacity(0.1),
              //         primaryColor: AppColor.mainColor,
              //         accentColor: AppColor.mainColor,
              //         textSelectionColor: Colors.white,
              //         cardColor: Color(0xff424343),
              //         bottomNavigationBarTheme: BottomNavigationBarThemeData(
              //             unselectedItemColor: Colors.white60,
              //             selectedItemColor: Colors.white),
              //         textTheme: TextTheme(
              //           caption: TextStyle(
              //               fontFamily: 'DMSans',
              //               fontWeight: FontWeight.bold,
              //               fontSize: 20,
              //               color: Colors.white),
              //           headline6: TextStyle(
              //               fontFamily: 'DMSans',
              //               fontSize: 25,
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold),
              //           headline5: TextStyle(
              //               fontFamily: 'DMSans',
              //               fontSize: 14,
              //               color: AppColor.mainColor),
              //           headline3: TextStyle(
              //               fontFamily: 'DMSans',
              //               fontSize: 14,
              //               color: AppColor.mainColor),
              //           headline1: TextStyle(
              //             fontFamily: 'DMSans',
              //             fontSize: 27,
              //             color: AppColor.mainColor,
              //           ),
              //           bodyText2: TextStyle(
              //               fontFamily: 'DMSans',
              //               fontSize: 14,
              //               color: Colors.white,
              //               fontWeight: FontWeight.w600),
              //           subtitle1: TextStyle(
              //               fontFamily: 'DMSans',
              //               fontSize: 14,
              //               color: Colors.grey,
              //               fontWeight: FontWeight.bold),
              //           subtitle2: TextStyle(
              //               fontFamily: 'DMSans',
              //               fontSize: 14,
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold),
              //           headline2: TextStyle(
              //               fontFamily: 'DMSans',
              //               fontSize: 16,
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold),
              //           headline4: TextStyle(
              //             fontSize: 18.0,
              //             color: AppColor.mainColor,
              //             fontWeight: FontWeight.w900,
              //             fontFamily: 'DMSans',
              //           ),
              //           bodyText1: TextStyle(
              //               fontFamily: 'DMSans',
              //               fontSize: 12,
              //               color: Colors.white),
              //           button: TextStyle(
              //               fontFamily: 'DMSans',
              //               fontSize: 16,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.white),
              //         ),
              //       ),
              debugShowCheckedModeBanner: false,

              // home: Splashscreen(),
              // home: Splashscreen(),
            ),
          );
        },
      ),
    );
  }
}

ThemeData buildTheme(Brightness brightness) {
  // Future<void> getCurrentLocale() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  // }

  return brightness == Brightness.dark
      ? ThemeData.dark().copyWith(
          backgroundColor: const Color(0xffDEE8E9).withOpacity(0.1),
          brightness: Brightness.dark,
          primaryColor: AppColor.mainColor,
          cardColor: const Color(0xff424343),
          textSelectionColor: Colors.white,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              unselectedItemColor: Colors.white60,
              selectedItemColor: Colors.white),
          textTheme: const TextTheme(
            caption: TextStyle(
                fontFamily: 'DMSans',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white),
            headline6: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            headline5: TextStyle(
                fontFamily: 'DMSans', fontSize: 12, color: Colors.white),
            headline3: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 14,
                color: AppColor.mainColor,
                fontWeight: FontWeight.w600),
            headline1: TextStyle(
              fontFamily: 'DMSans',
              fontSize: 27,
              color: AppColor.mainColor,
            ),
            headline4: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontFamily: 'DMSans',
            ),
            bodyText2: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600),
            subtitle1: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.bold),
            subtitle2: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            headline2: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 16,
                color: Colors.white,
//                color: AppColor.textColor,
                fontWeight: FontWeight.bold),
            bodyText1: TextStyle(
                fontFamily: 'DMSans', fontSize: 12, color: Colors.white),
            button: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: AppColor.mainColor),
        )
      : ThemeData.light().copyWith(
          brightness: Brightness.light,
          backgroundColor: AppColor.mainColor,
          primaryColor: AppColor.mainColor,
          secondaryHeaderColor: AppColor.secondaryColor,
          cardColor: Colors.white,
          textSelectionColor: AppColor.mainColor,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              unselectedItemColor: Colors.black,
              selectedItemColor: AppColor.mainColor),
          textTheme: const TextTheme(
            //appbar text
            headline6: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            //catatagory text
            caption: TextStyle(
                fontFamily: 'DMSans',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black),
            headline5: TextStyle(
              fontFamily: 'DMSans',
              fontSize: 12,
              color: Color(0xff404040),
            ),

            headline3: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 14,
                color: AppColor.mainColor,
                fontWeight: FontWeight.w600),
            headline1: TextStyle(
              fontFamily: 'DMSans',
              fontSize: 27,
              color: AppColor.mainColor,
            ),
            bodyText2: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w600),

            subtitle2: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500),

            subtitle1: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.bold),
            headline2: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            headline4: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontFamily: 'DMSans',
            ),

            bodyText1: TextStyle(
                fontFamily: 'DMSans', fontSize: 12, color: Colors.black),
            button: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: AppColor.mainColor),
        );
}
