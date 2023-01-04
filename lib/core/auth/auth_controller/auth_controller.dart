import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';
import 'package:cicgreenloan/Utils/helper/local_storage.dart';
import 'package:cicgreenloan/utils/helper/api_base_helper.dart';
import 'package:cicgreenloan/utils/helper/custom_route_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../Utils/function/get_sharepreference_data.dart';
import '../../../Utils/function/set_current_user.dart';
import '../../../modules/member_directory/controllers/customer_controller.dart';
import '../../flavor/flavor_configuration.dart';

class AuthController extends GetxController {
  final _apiBasehelper = ApiBaseHelper();
  final mainUrl = FlavorConfig.instance.values!.apiBaseUrl;
  final _customerController = Get.put(CustomerController());
  final settingCon = Get.put(SettingController());

  ///check user
  ///'assets/images/svgfile/successIcon.svg'

  final phoneController = TextEditingController().obs;
  final settingController = Get.put(SettingController());
  final isLoginSuccess = false.obs;
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
        debugPrint("Log in $value");
        checkRegisteredLoading(false);
        if (value['success']) {
          if (value['password']) {
            context.go('/login/login-password');
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const LoginWithPassWord()));
          } else {
            context.go(
                '/login/verify-phone?phone=%2B${_phoneSubmit().replaceAll('+', '')}');
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

        await setCurrentUser(value['access_token']);

        await LocalData.userLogin('userLogin', true);
        // context.push('/setpincode');

        await _customerController.getUser().then((user) async {
          settingController.fetchSetting(userType: 'qm');
          settingController.onSwitchScreen(value: false);
          settingController.onGetScreenMode();
          settingController.isModeSwitchAble.value = false;

          settingController.fetchAppBottomBar(userType: 'qm');
          settingController.fetchAppSetting(
              context: context, isSwitchSplashScreen: true, userType: 'qm');
          // if (user.memberType!.length > 1) {
          //   settingController.onSwitchScreen(value: false);
          //   settingController.onGetScreenMode();
          //   settingController.isModeSwitchAble.value = true;
          //   settingController.fetchSetting(userType: 'qm');
          //   settingController.fetchAppBottomBar(userType: 'qm');
          //   settingController.fetchAppSetting(
          //       context: context, isSwitchSplashScreen: true, userType: 'qm');
          // } else if (user.memberType!.length == 1 &&
          //     user.memberType![0].toLowerCase() == 'am') {
          //   settingController.fetchSetting(userType: 'am');
          //   settingController.onSwitchScreen(value: true);
          //   settingController.onGetScreenMode();
          //   settingController.isModeSwitchAble.value = false;

          //   settingController.fetchAppBottomBar(userType: 'am');
          //   settingController.fetchAppSetting(
          //       context: context, isSwitchSplashScreen: true, userType: 'am');
          // } else if (user.memberType!.length == 1 &&
          //     user.memberType![0].toLowerCase() == 'qm') {
          //   settingController.fetchSetting(userType: 'qm');
          //   settingController.onSwitchScreen(value: false);
          //   settingController.onGetScreenMode();
          //   settingController.isModeSwitchAble.value = false;

          //   settingController.fetchAppBottomBar(userType: 'qm');
          //   settingController.fetchAppSetting(
          //       context: context, isSwitchSplashScreen: true, userType: 'qm');
          // }
          if (user.pinCode != null && user.pinCode!.isNotEmpty) {
            settingController.onCheckAuthentication();
            // if (user.memberType!.toLowerCase() == 'qm') {
            //   settingController.onSwitchScreen(value: false);
            //   settingController.onGetScreenMode();
            //   settingController.fetchSetting(userType: 'qm');
            //   settingController.fetchAppBottomBar(userType: 'qm');
            //   settingController.fetchAppSetting(
            //       context: context, isSwitchSplashScreen: true, userType: 'qm');
            //   Future.delayed(const Duration(seconds: 1), () {});
            // } else {
            //   settingController.onSwitchScreen(value: true);
            //   settingController.onGetScreenMode();
            //   settingController.fetchSetting(userType: 'am');
            //   settingController.fetchAppBottomBar(userType: 'am');
            //   settingController.fetchAppSetting(
            //       context: context, isSwitchSplashScreen: true, userType: 'am');
            //   Future.delayed(const Duration(seconds: 1), () {});
            // }
            // ignore: use_build_context_synchronously
            context.go('/');
            GoRouter.of(context).routerDelegate.navigatorKey;
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const PaymentSchedule(),),)
          } else {
            settingController.onCheckAuthentication();
            context.go('/login/login-password/setpincode?status=set');
          }
        });
        onLoginLoading(false);
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
  final isForgetPassword = true.obs;
  Future<void> onRequestOTP(BuildContext context) async {
    onRequestOTPLoading(true);
    await _apiBasehelper.onNetworkRequesting(
      fullURL: '${mainUrl}request-otp',
      methode: METHODE.post,
      isAuthorize: false,
      body: {'phone': _phoneSubmit()},
    ).then((value) async {
      debugPrint("Value: $value");
      onRequestOTPLoading(false);
      final userToken = await LocalStorage.getStringValue(key: 'currentUser');
      debugPrint("user token $userToken");
      settingCon.appSettingNofier.value.userToken = 'sdfsdfs';

      settingCon.appSettingNofier.notifyListeners();
      // ignore: use_build_context_synchronously
      context.go(
          '/login/login-password/verify-otp?isForgetPassword=true&phone=%2B${_phoneSubmit().replaceAll('+', '')}');
    }).onError((ErrorModel error, stackTrace) {
      onRequestOTPLoading(false);
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
