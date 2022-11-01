import 'dart:io';
import 'package:get/get.dart';
import 'package:cicgreenloan/generated/l10n.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Utils/helper/color.dart';
import 'auth_controller/auth_controller.dart';

class LoginWithPassWord extends StatefulWidget {
  const LoginWithPassWord({Key? key}) : super(key: key);

  @override
  State<LoginWithPassWord> createState() => _LoginWithPassWordState();
}

class _LoginWithPassWordState extends State<LoginWithPassWord> {
  final _authController = Get.put(AuthController());

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
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
                const Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 26,
                    color: AppColor.mainColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const Text(
                  'CiC Mobile App',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 26,
                    color: AppColor.mainColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // const SizedBox(
                //   height: 20.0,
                // ),
                // Text(S.of(context).password,
                //     textAlign: TextAlign.center,
                //     style: Theme.of(context).textTheme.headline2),
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
