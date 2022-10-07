import 'dart:convert';

import 'package:cicgreenloan/Utils/app_settings/models/app_data.dart';
import 'package:cicgreenloan/Utils/app_settings/models/ui_setting_data.dart';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/Utils/function/storelocal_data.dart';
import 'package:cicgreenloan/modules/about_cic/model/about_cic_model.dart';
import 'package:cicgreenloan/Utils/app_settings/models/contact_us.dart';
import 'package:cicgreenloan/Utils/app_settings/models/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:local_auth/local_auth.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import '../models/app_setting.dart';
import '../models/slide_model.dart';
import '../models/term_and_condtion.dart';

class SettingController extends GetxController {
  final settingApp = Setting().obs;
  final appSetting = Setting().obs;
  Setting cicAppSetting = Setting();
  final isAutoDarkMode = true.obs;
  final token = ''.obs;

  final isLoading = false.obs;
  final isLoadingAboutCiC = false.obs;

  final appSettingVersion = AppSetting().obs;
  final aboutApp = AppSetting().obs;
  final appSettings = AppSettingModel().obs;
  final appSettingDataList = <AppSettingData>[].obs;
  final termAndcondtion = TermAndConditions().obs;
  final aboutCiCFeature = AboutCiCFeature().obs;
  UIData uiSettingData = UIData();
  final canCheckBiometrics = false.obs;
  final availableBiometrics = <BiometricType>[].obs;
  final authorized = 'Not Authorized'.obs;
  final isAuthenticating = false.obs;
  bool isHideBottomNavigation = false;
  int selectedIndex = 0;
  var menuList = <AppSettingData>[].obs;
  final isLandScapView = false.obs;

  onHideBottomNavigationBar(bool isHide) {
    isHideBottomNavigation = isHide;
    update();
  }

  void onTap(int index) {
    selectedIndex = index;
    update();

    if (selectedIndex == 1) {
      onHideBottomNavigationBar(true);
    } else {
      onHideBottomNavigationBar(false);
    }
  }

  final contactUs = ContactUs().obs;
  List<SlideModel>? slideList = <SlideModel>[];
  List<SlideModel>? splashScreen = <SlideModel>[];
  String url = '${GlobalConfiguration().getValue('api_base_urlv3')}app-setting';

  Future<Setting> fetchSetting() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await http.get(Uri.parse(url)).then((response) {
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body)['app-setting'];
        settingApp.value = Setting.fromJson(responseData);
        cicAppSetting = Setting.fromJson(responseData);
        update();

        pref.setString('setting', json.encode(settingApp.value));
      } else {}
    });
    return settingApp.value;
  }

  Future<void> getSettingFromLocal() async {
    appSetting.value = await getLocalSetting('setting');
  }

  bool? isloading = false;
  Future<UIData> onFetchUIData() async {
    isloading = true;

    String url = '${GlobalConfiguration().getValue('api_base_urlv3')}ui';
    try {
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['data'];
          uiSettingData = UIData.fromJson(responseJson);

          update();
        } else {}
      });
    } finally {
      isloading = false;
      update();
    }
    return uiSettingData;
  }

  bool? isOnFingerPrint = false;
  Future<List<SlideModel>> fetchSlide() async {
    slideList!.clear();
    SlideModel slide = SlideModel();
    isLoading(true);
    var token = await LocalData.getCurrentUser();
    bool biometrics = await LocalData.getAuthenValue('authen');
    String url =
        '${GlobalConfiguration().get('api_base_urlv3')}slide?module=Slide&biometrics=$biometrics';
    try {
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        debugPrint('hii1234567:${response.body}');
        var responseJson = json.decode(response.body)['data'];
        if (response.statusCode == 200) {
          responseJson.map((data) {
            slide = SlideModel.fromJson(data);
            if (!slideList!.contains(slide)) {
              slideList!.add(slide);
            }
          }).toList();
        } else {}
      });
    } finally {
      isLoading(false);
    }

    return slideList!;
  }

  Future<List<SlideModel>> fetchSplashScreen() async {
    slideList!.clear();
    SlideModel slide = SlideModel();
    isLoading(true);
    var token = LocalData.getCurrentUser();
    String url =
        '${GlobalConfiguration().get('api_base_url')}slide?type=Splash Screen';
    try {
      await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        var responseJson = json.decode(response.body)['data'];
        if (response.statusCode == 200) {
          responseJson.map((data) {
            slide = SlideModel.fromJson(data);
            if (!splashScreen!.contains(slide)) {
              splashScreen!.add(slide);
            }
          }).toList();
        } else {}
      });
    } finally {
      isLoading(false);
    }

    return splashScreen!;
  }

  Future<ContactUs> fetchCompanyInfo() async {
    debugPrint("This function is work");
    isLoading(true);
    var token = await LocalData.getCurrentUser();
    String url = '${GlobalConfiguration().get('api_base_urlv3')}support';
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['contact_us'];
          contactUs.value = ContactUs.fromJson(responseJson);
          debugPrint("Telegram:${contactUs.value.telegramLink}");
          debugPrint("Phone:${contactUs.value.companyPhoneList}");
        } else {
          debugPrint("This function is error");
        }
      });
    } catch (e) {
      //
    } finally {
      isLoading(false);
    }
    return contactUs.value;
  }

  Future<TermAndConditions> fetchTermAndCondtions() async {
    var token = await LocalData.getCurrentUser();
    String url = '${GlobalConfiguration().get('api_base_url')}support';
    try {
      isLoading(true);
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['term_and_conditions'];
          termAndcondtion.value = TermAndConditions.fromJson(responseJson);
        } else {}
      });
    } finally {
      isLoading(false);
    }
    return termAndcondtion.value;
  }

  final privacyPolicy = PrivacyPolicy().obs;
  final isPrivacyPolicy = false.obs;
  Future<PrivacyPolicy> fetchPrivacyPolicy() async {
    var token = await LocalData.getCurrentUser();
    String url = '${GlobalConfiguration().get('api_base_urlv3')}support';
    try {
      isPrivacyPolicy(true);
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['privacy_and_policies'];
          privacyPolicy.value = PrivacyPolicy.fromJson(responseJson);
        } else {}
      });
    } finally {
      isPrivacyPolicy(false);
    }
    return privacyPolicy.value;
  }

  Future<AboutCiCFeature> fetchAboutCiCFeatureApp() async {
    var token = await LocalData.getCurrentUser();
    String url = '${GlobalConfiguration().get('api_base_url')}app-setting';
    try {
      isLoading(true);
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['about_app'];
          aboutCiCFeature.value = AboutCiCFeature.fromJson(responseJson);
        } else {}
      });
    } finally {
      isLoading(false);
    }
    return aboutCiCFeature.value;
  }

  Future<AppSetting> fetchAppVersion() async {
    String url = '${GlobalConfiguration().get('api_base_url')}app-setting';
    isLoadingAboutCiC(true);
    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['app-setting'];
          if (responseJson['about_app'] != null) {
            aboutApp.value = AppSetting.fromJson(responseJson);
          }

          appSettingVersion.value = AppSetting.fromJson(responseJson);
        } else {}
      });
    } finally {
      isLoadingAboutCiC(false);
    }
    return appSettingVersion.value;
  }

  late AnimationController animationController;
  Future<List<AppSettingData>> fetchAppSetting(
      {BuildContext? context, bool? isSwitchSplashScreen}) async {
    var token = await LocalData.getCurrentUser();
    isLoading(true);
    String url =
        '${GlobalConfiguration().get('api_base_urlv3')}service?partial=menu';

    try {
      await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body)['data'];
          responseJson.map((data) {
            var settingData = AppSettingData.fromJson(data);
            appSettingDataList.add(settingData);
          }).toList();
          debugPrint(
              "App Setting Data for Funtion:${appSettingDataList.length}");
        } else {}
      });
    } finally {
      isLoading(false);
      if (isSwitchSplashScreen == true) {
        Future.delayed(const Duration(seconds: 1), () {
          animationController
              .reverse()
              .then((value) => Navigator.pop(context!));
        });
      }
    }
    return appSettingDataList;
  }

  onSwitchNotificationSetting() async {
    final token = await LocalData.getCurrentUser();
    final url =
        '${GlobalConfiguration().get('api_base_urlv2')}setting/toggle-notification';
    try {
      await http.post(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      }).then((response) {
        if (response.statusCode == 200) {
        } else {
          return Future.error('Error Json');
        }
      });
    } finally {}
  }

  @override
  void onInit() {
    fetchSlide();
    fetchSetting();
    onFetchUIData();
    super.onInit();
  }
}
