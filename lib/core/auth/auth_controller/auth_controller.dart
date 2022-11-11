import 'package:cicgreenloan/utils/helper/api_base_helper.dart';
import 'package:cicgreenloan/utils/helper/custom_route_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../Utils/function/get_sharepreference_data.dart';
import '../../../Utils/function/set_current_user.dart';
import '../../../modules/member_directory/controllers/customer_controller.dart';
import '../../flavor/flavor_configuration.dart';
import '../verify_phone.dart';
import '../verify_set_password.dart';

class AuthController extends GetxController {
  final _apiBasehelper = ApiBaseHelper();
  final mainUrl = FlavorConfig.instance.values!.mainApiUrl;
  final _customerController = Get.put(CustomerController());

  ///check user
  ///'assets/images/svgfile/successIcon.svg'
  final phoneController = TextEditingController().obs;
  final countryCode = '+855'.obs;
  String _phoneSubmit() {
    if (phoneController.value.text.startsWith('0')) {
      return countryCode + phoneController.value.text.substring(1);
    } else {
      return countryCode + phoneController.value.text;
    }
  }

  final checkRegisteredLoading = false.obs;
  Future<void> checkPhoneNumber(BuildContext context) async {
    if (phoneController.value.text.isEmpty) {
      customRouterSnackbar(
        title: "Login failed",
        description: 'Please enter phone number to continue.',
        type: SnackType.error,
      );
    } else {
      debugPrint('Submited :${_phoneSubmit()}');
      checkRegisteredLoading(true);
      await _apiBasehelper.onNetworkRequesting(
        fullURL: '${mainUrl}register',
        methode: METHODE.post,
        isAuthorize: false,
        body: {'phone': _phoneSubmit()},
      ).then((value) {
        checkRegisteredLoading(false);
        if (value['success']) {
          if (value['password']) {
            context.push('/password');
          } else {
            Navigator.push<bool>(
              context,
              MaterialPageRoute(
                builder: (context) => VerifyPhone(
                  phoneNumber: _phoneSubmit(),
                ),
              ),
            );
          }
        } else {
          customRouterSnackbar(
              title: 'Login Fail',
              description: 'Phone Number is invalid',
              type: SnackType.error);
        }
        debugPrint('checkRegistered = $value');
      }).onError((ErrorModel error, stackTrace) {
        checkRegisteredLoading(false);
        customRouterSnackbar(
            title: 'Something went Wrong',
            description: 'Please try to refresh or reopen the app',
            type: SnackType.error);
        debugPrint(
            'checkRegistered Error ${error.statusCode} : ${error.bodyString}');
      });
    }
  }

  ///login with password
  final passwordController = TextEditingController().obs;
  final onLoginLoading = false.obs;

  Future<void> onLogin(BuildContext context) async {
    if (passwordController.value.text.isEmpty) {
      customRouterSnackbar(
          title: 'Warning !',
          description: 'Please enter password to continue',
          type: SnackType.error);
    } else {
      onLoginLoading(true);
      await _apiBasehelper.onNetworkRequesting(
        fullURL: '${mainUrl}login',
        methode: METHODE.post,
        isAuthorize: false,
        body: {
          'phone': _phoneSubmit(),
          'password': passwordController.value.text
        },
      ).then((value) async {
        debugPrint('Success $value');
        onLoginLoading(false);
        await setCurrentUser(value['access_token']);

        await LocalData.userLogin('userLogin', true);
        // context.push('/setpincode');
        await _customerController.getUser().then((value) {
          if (value.pinCode != null && value.pinCode!.isNotEmpty) {
            debugPrint('Goto Homescreen');
            context.go('/?fromPage=loginPage');
          } else {
            debugPrint('Goto Set Pincode');
            context.push('/setpincode');
          }
        });
      }).onError(
        (ErrorModel error, stackTrace) {
          onLoginLoading(false);
          customRouterSnackbar(
              title: 'Error !',
              description: error.bodyString['message'] ?? '',
              type: SnackType.error);
          debugPrint(
              'onLogin Error ${error.statusCode} : ${error.bodyString['message']}');
        },
      );
    }
  }

  ///request-otp
  final onRequestOTPLoading = false.obs;
  Future<void> onRequestOTP(BuildContext context) async {
    onRequestOTPLoading(true);
    await _apiBasehelper.onNetworkRequesting(
      fullURL: '${mainUrl}request-otp',
      methode: METHODE.post,
      isAuthorize: false,
      body: {'phone': _phoneSubmit()},
    ).then((value) {
      onRequestOTPLoading(false);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerifySetPassword(
            isForgetPassword: true,
            phone: _phoneSubmit(),
          ),
        ),
      );
    }).onError((ErrorModel error, stackTrace) {
      onRequestOTPLoading(false);
      debugPrint(
          'onRequestOTP Error ${error.statusCode} : ${error.bodyString['message']}');
    });
  }

  ///verify-otp
  Future onChangePassword() async {
    await _apiBasehelper
        .onNetworkRequesting(
          fullURL: '${mainUrl}verify-otp',
          methode: METHODE.post,
          isAuthorize: false,
          body: {
            'phone': _phoneSubmit(),
            // 'verify_code': _otpCode,
            'type': 'reset_password',
          },
        )
        .then((value) {})
        .onError((ErrorModel error, stackTrace) {
          debugPrint(
              'onChangePassword Error ${error.statusCode} : ${error.bodyString['message']}');
        });
  }

  ///Clearlogin
  void clearAuth() {
    phoneController.value.text = '';
    passwordController.value.text = '';
    removeUser('access_token');
  }
}
