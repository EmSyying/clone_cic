import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static Future<String?> getCurrentUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('current_user');
    return token;
  }

  static Future<String?> ongetData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('user');
    return token;
  }

  static storeBiotricType(String key, String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      pref.setString(key, value);
    } catch (e) {
      debugPrint("$e");
    }
  }

  static Future<String?> getBiotricType(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getString(key);
  }

  static storeAuthenthicationKey(String? key, bool? value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(key!, value ?? false);
  }

  static Future<bool> getAuthenValue(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return (pref.getBool(key) ?? false);
  }

  static storeNotification(String? key, bool? value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(key!, value ?? false);
  }

  static Future<bool> getNotificationKey(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return (pref.getBool(key) ?? false);
  }

  static setPINCode(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String?> getPINCode(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }

  static Future<void> removePINcode(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(key);
  }

  static hideAddress(String? key, bool? value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(key!, value ?? false);
  }

  static Future<bool> getAddress(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return (pref.getBool(key) ?? false);
  }

  static storeAppTou(String? key, bool? value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(key!, value ?? false);
  }

  static Future<bool> showAppTou(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return (pref.getBool(key) ?? false);
  }

  static userLogin(String? key, bool? value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(key!, value ?? false);
  }

  static Future<bool> isUserLogin(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return (pref.getBool(key) ?? false);
  }
}
