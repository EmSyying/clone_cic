import 'package:cicgreenloan/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingAppController extends GetxController {
  final appVersion = '1.0.0'.obs;
  getLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('locale') != null) {
      S.load(Locale((prefs.getString('locale'))!));
    } else {
      S.load(const Locale('en'));
    }
  }

  changeLanguage(String localeCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('locale', localeCode);
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('current_user');
  }
}
