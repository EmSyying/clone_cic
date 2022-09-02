import 'dart:convert';
import 'dart:io';
import 'package:cicgreenloan/core/auth/set_pin_code.dart';
import 'package:get/get.dart';
import 'package:cicgreenloan/generated/l10n.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/function/get_sharepreference_data.dart';
import '../../Utils/function/set_current_user.dart';
import '../../Utils/helper/color.dart';
import '../../modules/dashboard/buttom_navigation_bar.dart';
import '../../modules/member_directory/controllers/customer_controller.dart';
import 'auth_controller/auth_controller.dart';

class LoginWithPassWord extends StatefulWidget {
  const LoginWithPassWord({Key? key}) : super(key: key);

  @override
  State<LoginWithPassWord> createState() => _LoginWithPassWordState();
}

class _LoginWithPassWordState extends State<LoginWithPassWord> {
  final _authController = Get.put(AuthController());
  final _customerController = Get.put(CustomerController());
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;

  String? token;

  getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('current_user');
    });
  }

  onLogin() async {
    String url = '${GlobalConfiguration().getValue('main_api_url')}login';
    await http.post(Uri.parse(url), headers: {
      'Accept': 'application/json',
    }, body: {
      // 'phone': widget.phone,
      // 'password': passwordController.text
    }).then((response) async {
      if (response.statusCode == 200) {
        debugPrint('Log IN');
        var userToken = json.decode(response.body)['access_token'];
        // _customerController.isLogin(true);
        _customerController.isLoginSuccess(true);
        setCurrentUser(userToken);
        await LocalData.userLogin('userLogin', true);
        // await _customerController.getUser();

        _customerController.customer.value.pinCode != ""
            // ignore: use_build_context_synchronously
            ? Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const PaymentSchedule(fromPage: 'loginPage'),
                ),
              )
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SetPinCode(
                    status: 'set',
                  ),
                ),
              );
      } else {
        Get.snackbar("", "Login failed",
            borderRadius: 8,
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(10),
            overlayBlur: 3.0,
            titleText: const Text(
              'Login failed',
              style: TextStyle(color: Colors.white),
            ),
            messageText: const Text(
              'Password is not correct',
              style: TextStyle(color: Colors.white),
            ),
            snackStyle: SnackStyle.FLOATING);
        // Get.snackbar("", "",
        //     titleText: Text("Login failed"),
        //     messageText: Text(
        //       "Password is not correct",
        //       style: TextStyle(fontSize: 22),
        //     ),
        //     snackPosition: SnackPosition.TOP);
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  // requestOtp() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   _isLoading ? showLoadingDialog(context) : Container();

  //   String url = '${GlobalConfiguration().getValue('main_api_url')}request-otp';
  //   try {
  //     final response = await http.post(Uri.parse(url), headers: {
  //       'Accept': 'applicatio/json',
  //       'Authorization': 'Bearer $token',
  //     }, body: {
  //       'phone': widget.phone
  //     });
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => VerifySetPassword(
  //             isForgetPassword: true,
  //             phone: widget.phone!,
  //           ),
  //         ),
  //       );
  //     } else {
  //       _isLoading = false;
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  //   setState(() {
  //     _isLoading = !_isLoading;
  //   });
  // }

  @override
  void initState() {
    getCurrentUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Platform.isIOS
                          ? const Icon(Icons.arrow_back_ios)
                          : const Icon(Icons.arrow_back),
                      color: Get.theme.brightness != Brightness.light
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/Logo/cic.png',
                    width: 160,
                  ),
                ),
                Text(S.of(context).continuePhone,
                    style: Theme.of(context).textTheme.headline1),
                const SizedBox(
                  height: 20.0,
                ),
                Text(S.of(context).password,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2),
                const SizedBox(
                  height: 50.0,
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(S.of(context).password,
                            style: Theme.of(context).textTheme.bodyText1),
                        CupertinoTextField(
                          key: const Key("password"),
                          obscureText: true,
                          autofocus: true,
                          textInputAction: TextInputAction.done,
                          onSubmitted: (v) {
                            _authController.onLogin(context);
                          },
                          controller: _authController.passwordController.value,
                          style: Theme.of(context).textTheme.headline2,
                          padding: const EdgeInsets.all(15.0),
                          placeholder: S.of(context).enterPassword,
                          placeholderStyle:
                              Theme.of(context).textTheme.bodyText1,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: AppColor.mainColor))),
                          suffix: IconButton(
                            key: const Key("Login"),
                            icon: _authController.onLoginLoading.value
                                ? const CupertinoActivityIndicator()
                                : Icon(
                                    Icons.arrow_forward_ios,
                                    color: Theme.of(context).primaryColor,
                                    size: 16,
                                  ),
                            onPressed: () {
                              _authController.onLogin(context);
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: CupertinoButton(
                            onPressed: () {
                              _authController.onRequestOTP(context);
                            },
                            child: _authController.onRequestOTPLoading.value
                                ? const CupertinoActivityIndicator()
                                : Text(
                                    S.of(context).forgotPassword,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 14,
                                        color: Theme.of(context).primaryColor),
                                  ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
