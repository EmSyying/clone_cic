import 'dart:convert';
import 'dart:io';

import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/setting_modules/screens/sub_setting_screen/change_password.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sms_autofill/sms_autofill.dart';

import '../../Utils/helper/custom_appbar.dart';
import '../../Utils/helper/custom_snackbar.dart';

class VerifyPhone extends StatefulWidget {
  final String? phoneNumber;
  const VerifyPhone({Key? key, this.phoneNumber}) : super(key: key);

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  String _otpCode = '1243';
  final _customerController = Get.put(CustomerController());
  bool isloading = false;

  getAppSign() async {
    SmsAutoFill().listenForCode;
  }

  // _getSignatureCode() async {
  //   String signature = await SmsRetrieved.getAppSignature();
  // }

  onVerifyOtp() async {
    var sharedPrefs = await SharedPreferences.getInstance();

    setState(() {
      isloading = true;
    });
    String url = '${GlobalConfiguration().getValue('main_api_url')}verify-otp';

    try {
      await http.post(Uri.parse(url), headers: {
        'Accept': 'application/json'
      }, body: {
        'phone': widget.phoneNumber,
        'verify_code': _otpCode
      }).then((response) {
        if (response.statusCode == 200) {
          var userToken = json.decode(response.body)['access_token'];
          sharedPrefs.setString('current_user', userToken ?? "");

          _customerController.isLoginSuccess(true);
          LocalData.userLogin('userLogin', true);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangePassword(
                isForgetPassword: false,
              ),
            ),
          );
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => PaymentSchedule(),
          //   ),
          // );
        } else {
          debugPrint("OTP Body:${response.body}");
          customSnackbar(
              isFailed: true,
              color: Colors.red,
              titleText: 'OTP is invalid',
              messageText: 'Please Try Again');
        }
      });
    } finally {
      setState(() {
        isloading = false;
      });
    }
  }

  Widget mybody(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/Logo/cic.png',
                  width: 100.0,
                ),
                Text(
                  'Verify OTP',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 25,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Code is Sent to ${widget.phoneNumber}',
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 4,
                    obscureText: true,

                    animationType: AnimationType.fade,

                    autoFocus: true,
                    pinTheme: PinTheme(
                      activeColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      inactiveColor: Colors.white,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeFillColor: Colors.white,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,

                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (code) {
                      setState(() {
                        _otpCode = code;
                      });
                      onVerifyOtp();
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      // print(value);
                      // setState(() {
                      //   currentText = value;
                      // });
                    },
                    beforeTextPaste: (text) {
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t receive code ?',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Text(
                      ' Request Again',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
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
        if (isloading)
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(
                        1.0,
                        0.0,
                      ),
                      blurRadius: 6,
                      color: Colors.black12)
                ],
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        // Positioned(
        //   bottom: 20.0,
        //   left: 20.0,
        //   right: 20.0,
        //   child: Container(
        //     child: CustomButton(
        //       title: 'Verify OTP',
        //       onPressed: () {},
        //     ),
        //   ),
        // )
      ],
    );
  }

  @override
  void initState() {
    storeUserToken();
    getAppSign();
    // _getSignatureCode();
    super.initState();
  }

  Future<void> storeUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token',
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiYzVmM2Y1NTI5YTY1YTUwZjk1ZmYwNTlmNmY0YjBiZmQ3MzVlZWM1NGU5YjZkNDU3NDFiNzNkYWRkOTQxYjdjOTZkMTIwM2NkNTUzMTI3YzYiLCJpYXQiOjE1OTU0NzA5MzMsIm5iZiI6MTU5NTQ3MDkzMywiZXhwIjoxNjI3MDA2OTMzLCJzdWIiOiIxIiwic2NvcGVzIjpbIioiXX0.FAn3pCD4MHMMh1GxAWhmIe_PNjo4id2LZqvq3n3kCDg8rm_adjxsgMStu0CY6IvLOoC71k7UPCm4z83LfY3uJEMwHotYp8QZAXxmxYuUJLlec0aR5MspNJjH7utJOcn_dppzchijdnYTIMBFxXTuIKsA7T924p2QaCiM8wTQBU2RHeohQqZfIc3CJjDg_8wV8xQ9W3ZEoJcZHKuMODtaa3VOmagssiBt32eetByQ0-LGJqYPLOQ78fJupv6tkgrvICIinQSwIJWt7qCtq1O-VwRoH7GscSnKs4iFGeUbwvU8WTmlPu0VBtga65oc69ZwwscisXbpyLazxBjnQtDrGTwWnCHM9SMTktLX0m_vY4NmlHv2R0dHAy1s46fBqDYVxYmo2-eBSfpWFdm8qbvecvR5m4I96_7CGh7FmkP97MPlfGrg5KKWiMwuA1_BtGoSouUU37hZqXi4qK21dw1KWCcNKsMUOYXR65gF_rvWNUpcf5Jy8R-Vq94HyQi9a1DC1C8qv4Ltzw0iKZkSSJy3DRurNujbYLN3zRnDJrD4PJgoEM4mwU8_fh-sDzS6zgkxcwSb6rEyoXV_m_cDr3FPeZ32gU_BWmyFOCWLrk6IcC-9eF_ws5P1mu5unT_U6QJz1Ik-n81CggErY6s5SnB3XrRq59aEaDBiPvAbTAjQbsY');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'Verify OTP',
        leading: IconButton(
          icon: kIsWeb
              ? Icon(
                  Icons.arrow_back,
                  color: Get.theme.brightness == Brightness.light
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                )
              : Platform.isAndroid
                  ? Icon(
                      Icons.arrow_back,
                      color: Get.theme.brightness == Brightness.light
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                    )
                  : Icon(
                      Icons.arrow_back_ios,
                      color: Get.theme.brightness == Brightness.light
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                    ),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: mybody(context),
    );
  }
}
