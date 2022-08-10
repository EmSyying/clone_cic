import 'dart:convert';

import 'package:cicgreenloan/Utils/app_settings/models/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

storeJsonData(String json, String key) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString(key, json);
}

Future<Setting> getLocalSetting(String key) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var result = json.decode(pref.getString(key)!);
  Setting setting = Setting.fromJson(result);
  return setting;
}
