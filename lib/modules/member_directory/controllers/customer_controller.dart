import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/configs/firebase_deeplink/deeplink_service.dart';
import 'package:cicgreenloan/core/auth/login.dart';
import 'package:cicgreenloan/modules/member_directory/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:global_configuration/global_configuration.dart';
import 'dart:convert';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  final isloading = false.obs;
  final isLoginSuccess = false.obs;

  final residentStreet = ''.obs;
  final isSelectResiPro = false.obs;
  final resProId = 0.obs;
  final isValidateResidentProvince = true.obs;
  final isLogin = false.obs;
  final loanType = ''.obs;
  final shortenUrl = ''.obs;
  final dynamicParth = ''.obs;
  final customer = User().obs;
  Future<User> getUser() async {
    isloading(true);
    dynamic responseJson;
    var token = await LocalData.getCurrentUser();

    String userUrl = '${GlobalConfiguration().getValue('main_api_url')}user';
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
          customer.value = customer.value;
          var storePINCode = json.decode(response.body)['pin_code'];

          LocalData.setPINCode("setPIN", storePINCode);
          await DynamicLinkService.createDynamicLink(
                  path: 'profileDetail?memberID=${customer.value.customerId}',
                  description: customer.value.about,
                  title: customer.value.fullName,
                  image: customer.value.profile)
              .then((value) {
            shortenUrl.value = value.toString();

            dynamicParth.value = value.path;
          });
        } else {
          Get.to(const LoginScreen());
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
