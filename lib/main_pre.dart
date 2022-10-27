import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:url_strategy/url_strategy.dart';

import 'Utils/function/get_sharepreference_data.dart';
import 'Utils/function/notification_helper.dart';
import 'Utils/helper/local_storage.dart';
import 'core/flavor/flavor_configuration.dart';
import 'main.dart';

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
    await GlobalConfiguration().loadFromAsset("app_settings");
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
    FlavorConfig(
      flavor: Flavor.PRE,
      color: Colors.deepPurpleAccent,
      values: FlavorValues(
          baseUrl: "https://pre-cic.z1platform.com/",
          apiBaseUrl: "https://pre-cic.z1platform.com/api/v1/",
          mainApiUrl: "https://pre-cic.z1platform.com/api/",
          baseUrlV2: "https://pre-cic.z1platform.com/",
          apiBaseUrlV2: "https://pre-cic.z1platform.com/api/v2/",
          mainApiUrlV2: "https://pre-cic.z1platform.com/api/",
          apiBaseUrlV3: "https://pre-cic.z1platform.com/api/v3/"),
    );

    runApp(const MyApp());
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}
