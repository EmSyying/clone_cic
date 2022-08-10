import 'dart:convert';

import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/core/auth/set_pin_code.dart';
import 'package:cicgreenloan/modules/dashboard/buttom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PINCodeController extends GetxController {
  final currentUser = ''.obs;
  String? tokenKey;
  final token = ''.obs;
  final isLoading = false.obs;
  final pinCode = '1234'.obs;
  final pinCodeChange = ''.obs;
  Future<String?> getCurrentUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? currentUser = pref.getString('current_user');
    return currentUser;
  }

  Future<void> onSetPINCode(String pinCode) async {
    tokenKey = await LocalData.getCurrentUser();
    isLoading(true);
    String url =
        '${GlobalConfiguration().getValue('main_api_url')}user/set-pin-code';

    try {
      await http
          .post(Uri.parse(url),
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer $tokenKey'
              },
              body: json.encode({
                'pin_code': pinCode,
              }))
          .then((response) {
        if (response.statusCode == 200) {
          Get.offAll(const PaymentSchedule(
            fromPage: 'loginPage',
          ));
        } else {}
      });
    } finally {
      isLoading(false);
    }
  }

  Future<void> onVerifyPinCode(
      String pinCode, String status, BuildContext context) async {
    tokenKey = await LocalData.getCurrentUser();
    isLoading(true);
    String url =
        '${GlobalConfiguration().getValue('main_api_url')}user/verify-pin-code';

    try {
      await http
          .post(Uri.parse(url),
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer $tokenKey'
              },
              body: json.encode({
                'pin_code': pinCode,
              }))
          .then((response) {
        if (response.statusCode == 200) {
          if (status == 'Current') {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SetPinCode(
                          status: 'set',
                        )));
          } else {
            Get.offAll(
              const PaymentSchedule(
                fromPage: 'loginPage',
              ),
            );
          }
        } else {
          Get.snackbar(
            "Submit failed",
            "PIN Code and Verify PIN Code are not match, try again!",
            duration: const Duration(seconds: 1),
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            margin: const EdgeInsets.all(20.0),
          );
        }
      });
    } finally {
      isLoading(false);
    }
  }
}
