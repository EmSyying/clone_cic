import 'package:cicgreenloan/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> getCurrentLanguage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString('locale') == null) {
    S.load(const Locale('en'));
  } else {
    S.load(const Locale('locale'));
  }
}
