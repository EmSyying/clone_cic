import 'dart:convert';
import 'dart:io';
import 'package:cicgreenloan/core/auth/set_pin_code.dart';
import 'package:cicgreenloan/core/auth/verify_set_password.dart';
import 'package:flutter/foundation.dart';
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
import '../../Utils/pop_up_alert/custom_loading.dart';
import '../../modules/dashboard/buttom_navigation_bar.dart';
import '../../modules/member_directory/controllers/customer_controller.dart';

class LoginWithPassWord extends StatefulWidget {
  final String? phone;
  const LoginWithPassWord({Key? key, this.phone}) : super(key: key);

  @override
  State<LoginWithPassWord> createState() => _LoginWithPassWordState();
}

class _LoginWithPassWordState extends State<LoginWithPassWord> {
  final _customerController = Get.put(CustomerController());
  final passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;
  bool isLogin = false;

  String? token;
  // User? _user;

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
      'phone': widget.phone,
      'password': passwordController.text
    }).then((response) async {
      if (response.statusCode == 200) {
        debugPrint('Log IN');
        var userToken = json.decode(response.body)['access_token'];
        // _customerController.isLogin(true);
        _customerController.isLoginSuccess(true);
        setCurrentUser(userToken);
        await LocalData.userLogin('userLogin', true);
        await _customerController.getUser();

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

  requestOtp() async {
    setState(() {
      _isLoading = true;
    });
    _isLoading ? showLoadingDialog(context) : Container();

    String url = '${GlobalConfiguration().getValue('main_api_url')}request-otp';
    try {
      final response = await http.post(Uri.parse(url), headers: {
        'Accept': 'applicatio/json',
        'Authorization': 'Bearer $token',
      }, body: {
        'phone': widget.phone
      });
      if (response.statusCode == 200) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => VerifySetPassword(
              isForgetPassword: true,
              phone: widget.phone!,
            ),
          ),
        );
      } else {
        _isLoading = false;
      }
    } catch (e) {
      rethrow;
    }
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Widget mybody(BuildContext context) => SafeArea(
        child: WillPopScope(
          onWillPop: () async => false,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                        Column(
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
                                setState(() {
                                  _isLoading = true;
                                  onLogin();
                                });
                              },
                              controller: passwordController,
                              style: Theme.of(context).textTheme.headline2,
                              padding: const EdgeInsets.all(15.0),
                              placeholder: S.of(context).enterPassword,
                              placeholderStyle:
                                  Theme.of(context).textTheme.bodyText1,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: AppColor.mainColor))),
                              suffix: IconButton(
                                key: const Key("Login"),
                                icon: _isLoading
                                    ? const CupertinoActivityIndicator()
                                    : Icon(
                                        Icons.arrow_forward_ios,
                                        color: Theme.of(context).primaryColor,
                                        size: 16,
                                      ),
                                // onPressed: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => VerifyPhone(),
                                //     ),
                                //   );
                                // },
                                onPressed: () {
                                  if (passwordController.text.isEmpty) {
                                    ScaffoldMessenger(
                                        child: SnackBar(
                                      content:
                                          Text(S.of(context).enterPassword),
                                    ));
                                  } else {
                                    setState(() {
                                      _isLoading = true;
                                      onLogin();
                                      // _customerController.getUser();
                                    });
                                  }
                                },
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(),
                                ),
                                // Platform.isAndroid
                                //     ? FlatButton(
                                //         child: Text(
                                //           S.of(context).forgotPassword,
                                //           style: TextStyle(
                                //               fontFamily: 'Montserrat',
                                //               fontSize: 12,
                                //               color:
                                //                   Theme.of(context).primaryColor),
                                //         ),
                                //         onPressed: requestOtp,
                                //       )
                                //     : kIsWeb
                                //         ? CupertinoButton(
                                //             child: Text(
                                //               S.of(context).forgotPassword,
                                //               style: TextStyle(
                                //                   fontFamily: 'Montserrat',
                                //                   fontSize: 14,
                                //                   color: Theme.of(context)
                                //                       .primaryColor),
                                //             ),
                                //             onPressed: requestOtp,
                                //           )
                                //         : Platform.isIOS
                                //             ? CupertinoButton(
                                //                 child: Text(
                                //                   S.of(context).forgotPassword,
                                //                   style: TextStyle(
                                //                       fontFamily: 'Montserrat',
                                //                       fontSize: 14,
                                //                       color: Theme.of(context)
                                //                           .primaryColor),
                                //                 ),
                                //                 onPressed: requestOtp,
                                //               )
                                //             : Container(),
                                CupertinoButton(
                                  onPressed: requestOtp,
                                  child: Text(
                                    S.of(context).forgotPassword,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 14,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 80.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   bottom: 20.0,
              //   left: 20.0,
              //   right: 20.0,
              //   child: CustomButton(
              //       title: 'Request OTP',
              //       onPressed: () async {
              //         final code = await SmsAutoFill().getAppSignature;
              //         print(code);
              //       }),
              // ),
              IconButton(
                icon: kIsWeb
                    ? const Icon(Icons.arrow_back)
                    : Platform.isIOS
                        ? const Icon(Icons.arrow_back_ios)
                        : const Icon(Icons.arrow_back),
                color: Get.theme.brightness != Brightness.light
                    ? Colors.white
                    : Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.pop(context, true);
                },
              )
            ],
          ),
        ),
      );
  @override
  void initState() {
    getCurrentUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: mybody(context),
    );
  }
}
