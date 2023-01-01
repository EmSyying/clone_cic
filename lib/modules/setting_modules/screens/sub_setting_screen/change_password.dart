import 'dart:async';
import 'dart:io';

import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/Utils/chart/custom_text_form.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Utils/app_settings/controllers/appsetting_controller.dart';
import '../../../../Utils/helper/custom_appbar.dart';
import '../../../../core/flavor/flavor_configuration.dart';

// ignore: must_be_immutable
class ChangePassword extends StatefulWidget {
  bool? isForgetPassword;
  String? phone;
  ChangePassword({Key? key, this.isForgetPassword, this.phone})
      : super(key: key);
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
//  Change Password
  bool eightChars = false;
  bool specialChar = false;
  bool upperCaseChar = false;
  bool number = false;
  bool isSelectPass = true;
  bool isSelectPassConf = true;
  bool isTest = true;
  final _customerController = Get.put(CustomerController());
  final settingCon = Get.put(SettingController());
  Widget securityAlert() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20.0, top: 20.0),
          child: const Text("Your password must have:"),
        ),
        ValidationItem(title: "8 or more characters", valid: eightChars),
        ValidationItem(
            title: "Upper & lowercase letters", valid: upperCaseChar),
        ValidationItem(title: "At least one number", valid: number),
      ],
    );
  }

  final _scaffKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<ScaffoldState>();
  final passwordController = TextEditingController();
  final confirmPasswordCon = TextEditingController();

  var token = '';

  openSnackBar(String title) {
    ScaffoldMessenger(
      child: SnackBar(
        content: Text(title),
        duration: const Duration(seconds: 1),
      ),
    );
    // Timer(
    //   Duration(seconds: 1),
    //   () {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => PaymentSchedule(),
    //       ),
    //     );
    //   },
    // );
  }

  Future<void> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('current_user')!;
    });
  }

  bool isLoadingChangePassword = false;
  onChangePassword() async {
    String url = '${FlavorConfig.instance.values!.apiBaseUrl}user/set-password';
    setState(() {
      isLoadingChangePassword = true;
    });
    debugPrint("is change password");
    // isLoading ? showLoadingDialog(context) : Container();
    try {
      final response = await http.post(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }, body: {
        'password': passwordController.text,
        'password_confirmation': confirmPasswordCon.text
      });
      if (response.statusCode == 200) {
        debugPrint("is change password 1");
        ScaffoldMessenger(
          child: SnackBar(
            // ignore: use_build_context_synchronously
            content: Text(S.of(context).changePassword),
          ),
        );
        setState(() {
          isLoadingChangePassword = false;
        });
        await _customerController.getUser();
        debugPrint("is change password 2 ");
        _customerController.customer.value.pinCode != ""
            // ignore: use_build_context_synchronously
            ? context.go('/')
            // ignore: use_build_context_synchronously
            : context.push(
                '/login/verify-phone/changepassword/setpincode?status=set');
      } else {
        openSnackBar('Password is not match');
        setState(() {
          isLoadingChangePassword = false;
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() {
        isLoadingChangePassword = false;
      });
    }
  }

  bool isResetingPassword = false;

  onResetPassword() async {
    setState(() {
      isResetingPassword = true;
    });
    var token = await LocalData.getCurrentUser();
    String url =
        '${FlavorConfig.instance.values!.apiBaseUrl}user/reset-password';
    debugPrint("Phone number 11${widget.phone}");
    debugPrint(
        "Password 11${passwordController.text} ======= ${confirmPasswordCon.text}");

    try {
      final response = await http.post(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }, body: {
        'phone': widget.phone,
        'password': passwordController.text,
        'password_confirmation': confirmPasswordCon.text
      });
      if (response.statusCode == 200) {
        setState(() {
          isResetingPassword = false;
        });

        Timer(
          const Duration(seconds: 1),
          () {
            context.go('/');
          },
        );
      }
    } catch (e) {
      setState(() {
        isResetingPassword = false;
      });
      rethrow;
    }
  }

  bool isReadOnly = false;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
    passwordController.addListener(() {
      setState(() {
        eightChars = passwordController.text.length >= 8;
        number = passwordController.text.contains(RegExp(r'\d'), 0);
        upperCaseChar = passwordController.text.contains(RegExp(r'[A-Z]'), 0);
        specialChar = passwordController.text.isNotEmpty &&
            !passwordController.text.contains(RegExp(r'^[\w&.-]+$'), 0);
      });
    });
    confirmPasswordCon.addListener(() {
      setState(() {
        eightChars = confirmPasswordCon.text.length >= 8;
        number = confirmPasswordCon.text.contains(RegExp(r'\d'), 0);
        upperCaseChar = confirmPasswordCon.text.contains(RegExp(r'[A-Z]'), 0);
        specialChar = confirmPasswordCon.text.isNotEmpty &&
            !confirmPasswordCon.text.contains(RegExp(r'^[\w&.-]+$'), 0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: DefaultSizeWeb(
        child: Scaffold(
          key: _scaffKey,
          appBar: CustomAppBar(
              isLeading: true, title: 'Set Password', context: context),
          body: Column(
            children: [
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomTextFormField(
                              obsecure: isSelectPass,
                              controller: passwordController,
                              validator: (String value) {
                                if (value.isEmpty && value.length >= 8) {
                                  return 'Please Enter password';
                                }
                              },
                              icon: Icons.lock,
                              hinText: 'Enter password',
                              nameText: '',
                              isReadOnly: isReadOnly,
                              actionIcon: isSelectPass == true
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              onTap: () {
                                setState(() {
                                  isSelectPass = !isSelectPass;
                                });
                              }),
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Divider(
                              height: 2.0,
                              thickness: 1,
                            ),
                          ),
                          CustomTextFormField(
                              obsecure: isSelectPassConf,
                              controller: confirmPasswordCon,
                              validator: (value) {
                                if (value.length == 0 && value.length >= 8) {
                                  return 'Please Enter password';
                                }
                              },
                              icon: Icons.lock,
                              hinText: 'Enter confirm password',
                              nameText: '',
                              isReadOnly: isReadOnly,
                              actionIcon: isSelectPassConf == true
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              onTap: () {
                                setState(() {
                                  isSelectPassConf = !isSelectPassConf;
                                });
                              }),
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Divider(
                              height: 2.0,
                              thickness: 1,
                            ),
                          ),
                          securityAlert(),
                        ],
                      ),
                      isLoadingChangePassword || isResetingPassword
                          ? const Center(child: CircularProgressIndicator())
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 40.0),
                child: CustomButton(
                  isDisable: passwordController.text != "" &&
                          passwordController.text == confirmPasswordCon.text &&
                          confirmPasswordCon.text != ""
                      ? false
                      : true,
                  isOutline: false,
                  onPressed: _validator() &&
                          confirmPasswordCon.text == passwordController.text
                      ? () async {
                          settingCon.appSettingNofier.value.userToken =
                              await LocalData.getCurrentUser();
                          settingCon.appSettingNofier.notifyListeners();
                          widget.isForgetPassword!
                              ? onResetPassword()
                              : onChangePassword();
                        }
                      : () {},
                  title: 'Save',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validator() {
    return eightChars && number && upperCaseChar;
  }
}

// ignore: must_be_immutable
class ValidationItem extends StatefulWidget {
  bool? valid;
  String? title;
  ValidationItem({Key? key, this.title, this.valid}) : super(key: key);
  @override
  State<ValidationItem> createState() => _ValidationItemState();
}

class _ValidationItemState extends State<ValidationItem> {
  TextStyle getValidationStyle(bool validation) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        color: (validation) ? Colors.green : Colors.black87,
        fontFamily: 'DMSans',
        decoration: null);
  }

  Widget geValidationIcons(bool validation) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: (validation) ? Colors.green : Colors.red, width: 1),
        borderRadius: BorderRadius.circular(30),
//        color: (validation) ? Colors.green : Colors.red,
      ),
      height: 15.0,
      width: 15.0,
      child: Center(
        child: Icon(
          (validation) ? Icons.done : Icons.clear,
          size: 14,
          color: (validation) ? Colors.green : Colors.red,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          geValidationIcons(widget.valid!),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Text(
              widget.title!,
              style: getValidationStyle(widget.valid!),
            ),
          ),
        ],
      ),
    );
  }
}
