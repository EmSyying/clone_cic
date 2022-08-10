import 'package:shared_preferences/shared_preferences.dart';

getThem() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.getBool('isDark');
}
