import 'package:shared_preferences/shared_preferences.dart';

Future<void> setCurrentUser(String userToken) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('current_user', userToken);
}

Future<void> removeUser(String userToken) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(userToken);
}

// Future<String> getCurrentUser() async {
//   String userToken;
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   userToken = prefs.getString('current_user')!;
//   print('user $userToken');
//   return userToken;
// }
