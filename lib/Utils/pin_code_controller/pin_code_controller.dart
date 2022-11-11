import 'dart:convert';

import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/core/auth/set_pin_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/flavor/flavor_configuration.dart';
import '../../utils/helper/custom_route_snackbar.dart';

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

  Future<void> onSetPINCode(String pinCode, BuildContext context) async {
    tokenKey = await LocalData.getCurrentUser();
    isLoading(true);
    String url = '${FlavorConfig.instance.values!.mainApiUrl}user/set-pin-code';

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
          context.go('/');
        } else {
          debugPrint("Pin Code is failed");
        }
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
        '${FlavorConfig.instance.values!.mainApiUrl}user/verify-pin-code';

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
          customRouterSnackbar(
              title: 'Successful...!',
              description: 'Verify PIN Code Successful...!');
          if (status == 'Current') {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SetPinCode(
                          status: 'set',
                        )));
          } else {
            context.go('/?fromPage=loginPage');
            // Get.offAll(
            //   const PaymentSchedule(
            //     fromPage: 'loginPage',
            //   ),
            // );
          }
        } else {
          customRouterSnackbar(
            title: "Submit failed",
            description:
                "PIN Code and Verify PIN Code are not match, try again!",
            type: SnackType.error,
          );
        }
      });
    } finally {
      isLoading(false);
    }
  }
}
