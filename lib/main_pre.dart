import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:url_strategy/url_strategy.dart';

import 'Utils/function/get_sharepreference_data.dart';
import 'Utils/function/notification_helper.dart';
import 'Utils/helper/local_storage.dart';
import 'configs/firebase_deeplink/deeplink_service.dart';
import 'core/flavor/flavor_configuration.dart';
import 'main.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlavorConfig(
    flavor: Flavor.PRE,
    color: Colors.deepPurpleAccent,
    values: FlavorValues(
        baseUrl: "https://pre-cic.z1platform.com/",
        apiBaseUrl: "https://pre-cic.z1platform.com/api/v4/",
        // baseUrl: "https://cic.z1platform.com/",
        // apiBaseUrl: "https://cic.z1platform.com/api/v4/",
        androidBundleId: 'com.cambodianinvestorscorporation',
        iOSBundleName: 'com.cambodianinvestorscorporation.pre'),
  );
  await runZonedGuarded(() async {
    await LocalStorage.init();
    await Firebase.initializeApp();
    setPathUrlStrategy();
    await settingCon.onInitAppSetting();
    await NotificationHelper.initial();
    await DynamicLinkService.initDynamicLinks();
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
