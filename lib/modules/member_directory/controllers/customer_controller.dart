import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/modules/member_directory/models/user.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:get/get.dart';

import '../../../configs/route_configuration/route.dart';
import '../../../core/flavor/flavor_configuration.dart';
import '../../../utils/helper/custom_route_snackbar.dart';

class CustomerController extends GetxController {
  final isloading = false.obs;
  final isLoginSuccess = false.obs;
  final userType = ''.obs;

  final residentStreet = ''.obs;
  final isSelectResiPro = false.obs;
  final resProId = 0.obs;
  final isValidateResidentProvince = true.obs;
  final isLogin = false.obs;
  final loanType = ''.obs;
  final profileQRLink = ''.obs;
  final dynamicParth = ''.obs;
  final customer = User().obs;
  Future<User> getUser() async {
    isloading(true);
    dynamic responseJson;
    var token = await LocalData.getCurrentUser();

    String userUrl = '${FlavorConfig.instance.values!.apiBaseUrl}user';
    try {
      await http.get(Uri.parse(userUrl), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }).then((response) async {
        if (response.statusCode == 200) {
          isLoginSuccess(true);
          responseJson = json.decode(response.body);
          customer.value = User.fromJson(responseJson);
          debugPrint("Customer ID ${customer.value.customerId}");
          customer.value = customer.value;
          var storePINCode = json.decode(response.body)['pin_code'];

          LocalData.setPINCode("setPIN", storePINCode);
          isloading(false);
        } else {
          customRouterSnackbar(
              title: 'Something went wrong',
              description: 'Please try to login again.',
              type: SnackType.error);
          router.routerDelegate.navigatorKey.currentState!.context.go('/login');
          debugPrint('Error : ${response.statusCode} => ${response.body}');
        }
      });
    } finally {
      isloading(false);
    }
    return customer.value;
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('current_user');
  }
}
