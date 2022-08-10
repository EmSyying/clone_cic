// ignore_for_file: prefer_typing_uninitialized_variables, unnecessary_null_comparison, unused_local_variable

import 'dart:async';
import 'dart:convert';

import 'package:cicgreenloan/Utils/function/check_string_format.dart';
import 'package:cicgreenloan/Utils/function/set_current_user.dart';
import 'package:cicgreenloan/Utils/helper/custom_snackbar.dart';
import 'package:cicgreenloan/core/auth/verify_phone.dart';
import 'package:cicgreenloan/Utils/pop_up_alert/show_loading.dart';
import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/modules/dashboard/buttom_navigation_bar.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../Utils/helper/color.dart';
import 'login_with_password.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:global_configuration/global_configuration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _countryCode = '+855';
  bool _isLoading = false;
  bool isWaiting = false;
  String phoneNumber = "";
  String? languageCode = 'kh';
  var result;

  onRegister() async {
    String url = '${GlobalConfiguration().getValue('main_api_url')}register';

    setState(() {
      _isLoading = true;
      phoneNumber = checkPhoneNumber(phoneController.text);
    });

    if (phoneNumber[0] == '0') {
      setState(() {
        phoneNumber = phoneNumber.substring(1);
      });
    }

    http.post(Uri.parse(url), headers: {
      'Accept': 'application/json',
    }, body: {
      'phone': _countryCode + phoneNumber
    }).then((response) {
      if (response.statusCode == 200) {
        var responseError;
        var responseJson;
        var password;
        var success;
        setState(() {
          responseJson = json.decode(response.body);
          responseError = responseJson['message'];
          success = responseJson['success'];
          password = responseJson['password'];
        });

        if (success) {
          if (password) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginWithPassWord(
                  phone: _countryCode + phoneNumber,
                ),
              ),
            );
          } else {
            // redirector otp
            // set password

            result = Navigator.push<bool>(
              context,
              MaterialPageRoute(
                builder: (context) => VerifyPhone(
                  phoneNumber: _countryCode + phoneNumber,
                ),
              ),
            );
          }
        } else {
          // send message invalid phone
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
                'Phone number is invalid',
                style: TextStyle(color: Colors.white),
              ),
              snackStyle: SnackStyle.FLOATING);
        }

        // print(password);
      } else {
        debugPrint("Log In test:${response.body}");
        customSnackbar(
            context: context,
            isFailed: true,
            imgUrl: 'assets/images/svgfile/successIcon.svg',
            messageText: "Server Under Mantainance!",
            titleText: "Log In Failed");
      }
      setState(() {
        _isLoading = false;
      });
    });
  }

  onNavigateToLoginWithPassword() async {
    result = await Navigator.push(
        context,
        MaterialPageRoute<bool>(
            builder: (context) => LoginWithPassWord(
                  phone: _countryCode + phoneNumber,
                )));
    if (result == true) {
      setState(() {
        isWaiting = false;
      });
    }
  }

  onNavigateToVerifyPhone() async {
    result = await Navigator.push(
      context,
      MaterialPageRoute<bool>(
        builder: (context) => VerifyPhone(
          phoneNumber: _countryCode + phoneNumber,
        ),
      ),
    );
    if (result == true) {
      setState(() {
        isWaiting = false;
      });
    }
  }

  getAppSingature() async {
    final signCode = await SmsAutoFill().getAppSignature;
    debugPrint('Token Code $signCode');
  }

  onLogin() async {
    setState(() {
      _isLoading = true;
    });
    _isLoading ? showLoadingDialog(context) : Container();

    String url = '${GlobalConfiguration().getValue('main_api_url')}login';
    await http.post(Uri.parse(url), headers: {
      'Accept': 'application/json',
    }, body: {
      'phone': _countryCode + phoneNumber,
      'password': passwordController.text
    }).then((response) {
      if (response.statusCode == 200) {
        setState(() {
          _isLoading = true;
        });
        var userToken = json.decode(response.body)['access_token'];

        setCurrentUser(userToken);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const PaymentSchedule(),
          ),
        );
      }
      if (response.statusCode == 422) {
        setState(() {
          _isLoading = true;
        });
        ScaffoldMessenger(
            child: SnackBar(
          content: Text(
            'Password in corrected! Try again',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ));
      }
    });
  }

  Future<void> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    languageCode = prefs.getString('locale');
    if (prefs != null) {
      S.load(const Locale("en"));
    } else {
      S.load(const Locale('en'));
    }
  }

  @override
  void initState() {
    getLanguage();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    getLanguage();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: DefaultSizeWeb(
        child: Scaffold(
          key: _scaffoldKey,
          body: Stack(
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
                        Text(S.of(context).enterPinCode,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline2),
                        const SizedBox(
                          height: 50.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(S.of(context).enterPhone,
                                style: Theme.of(context).textTheme.bodyText1),
                            CupertinoTextField(
                              key: const Key('phoneNumber'),
                              onSubmitted: (v) {
                                onRegister();
                                FocusScope.of(context).unfocus();
                              },
                              textInputAction: TextInputAction.done,
                              controller: phoneController,
                              style: Theme.of(context).textTheme.headline2,
                              prefix: CountryCodePicker(
                                searchStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Theme.of(context).primaryColor),
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Montserrat',
                                    color: Theme.of(context).primaryColor),
                                dialogTextStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Theme.of(context).primaryColor),
                                initialSelection: 'Kh',
                                favorite: const ['+855', 'Kh'],
                                onChanged: (e) {
                                  setState(() {
                                    _countryCode = e.dialCode!;
                                  });
                                },
                              ),
                              padding: const EdgeInsets.all(15.0),
                              placeholder: S.of(context).enterPhone,
                              keyboardType: TextInputType.number,
                              placeholderStyle:
                                  Theme.of(context).textTheme.bodyText1,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: AppColor.mainColor))),
                              suffix: IconButton(
                                key: const Key("registerIcon"),
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
                                  if (phoneController.text.isEmpty) {
                                    Get.snackbar("", "",
                                        titleText: const Text("Login failed"),
                                        messageText: Text(
                                          S.of(context).enterPhone,
                                          style: const TextStyle(fontSize: 22),
                                        ),
                                        snackPosition: SnackPosition.TOP);
                                  }

                                  // _isLoading = true;
                                  onRegister();
                                },
                              ),
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
              // _isLoading ? CircularProgressIndicator() : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
