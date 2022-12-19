import 'package:cicgreenloan/Utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/Utils/helper/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class LoginInfo extends ChangeNotifier {
  bool get loggedIn => isLogIn;
  bool isLogIn = false;

  onGetLoginInfo() async {
    await LocalData.getCurrentUser().then((value) {
      if (value != null) {
        isLogIn = true;
        notifyListeners();
      } else {
        isLogIn = false;
        notifyListeners();
      }
    });
  }
}
