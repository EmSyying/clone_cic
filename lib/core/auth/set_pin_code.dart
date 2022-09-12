import 'dart:convert';
import 'dart:io';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/helper/custom_appbar.dart';
import '../../Utils/helper/custom_route_snackbar.dart';
import '../../Utils/pin_code_controller/pin_code_controller.dart';

class SetPinCode extends StatefulWidget {
  final String? status;

  const SetPinCode({Key? key, this.status}) : super(key: key);
  @override
  State<SetPinCode> createState() => _SetPinCodeState();
}

class _SetPinCodeState extends State<SetPinCode> {
  final setPinController = Get.put(PINCodeController());
  final customerController = Get.put(CustomerController());
  String? storePINCode;

  getCurrentPINCode() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String pinCode = json.decode(((pref.getString('pin_code'))!));
    return pinCode;
  }

  @override
  void initState() {
    if (widget.status == 'set') setPinController.pinCodeChange.value = '';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultSizeWeb(
      child: Scaffold(
        appBar: CustomAppBar(
          context: context,
          title: 'Change PIN Code',
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
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
          ),
        ),
        body: Stack(
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
                      widget.status == 'set'
                          ? 'Set PIN Code'
                          : 'Verify PIN Code',
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
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 60.0),
                      // child: PinFieldAutoFill(
                      //   autoFocus: true,
                      //   decoration: UnderlineDecoration(
                      //     bgColorBuilder: FixedColorBuilder(Colors.grey),
                      //     colorBuilder: FixedColorBuilder(
                      //       Colors.black.withOpacity(0.3),
                      //     ),
                      //     textStyle:
                      //         TextStyle(color: Theme.of(context).primaryColor),
                      //   ),
                      //   codeLength: 4,
                      //   onCodeChanged: (code) async {
                      //     if (code!.length == 4) {
                      //       setState(() {
                      //         print('code $code');
                      //       });
                      //       if (widget.status == 'set') {
                      //         setPinController.pinCodeChange.value = code;
                      //         Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) => SetPinCode(
                      //                       status: 'verify',
                      //                     )));
                      //       } else if (widget.status == 'verify') {
                      //         if (setPinController.pinCodeChange.value == code) {
                      //           setPinController.onSetPINCode(
                      //               setPinController.pinCodeChange.value);
                      //           LocalData.setPINCode("setPIN",
                      //               customerController.customer.value.pinCode!);
                      //           await LocalData.getPINCode('setPIN');
                      //         } else {
                      //           Get.snackbar(
                      //             "Submit failed",
                      //             "PIN Code and Verify PIN Code are not match",
                      //             snackPosition: SnackPosition.BOTTOM,
                      //             backgroundColor: Colors.red,
                      //             colorText: Colors.white,
                      //             icon: Icon(
                      //               Icons.cancel,
                      //               color: Colors.white,
                      //             ),
                      //             margin: EdgeInsets.all(20.0),
                      //           );
                      //         }
                      //       }
                      //     }
                      //   },
                      // ),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 4,
                        obscureText: true,
                        // obscuringCharacter: '*',
                        // obscuringWidget: FlutterLogo(
                        //   size: 24,
                        // ),
                        // blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        // validator: (v) {
                        //   if (v!.length < 3) {
                        //     return "I'm from validator";
                        //   } else {
                        //     return null;
                        //   }
                        // },

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
                        // errorAnimationController: errorController,
                        // controller: textEditingController,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (code) async {
                          if (widget.status == 'set') {
                            setPinController.pinCodeChange.value = code;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SetPinCode(
                                          status: 'verify',
                                        )));
                          } else if (widget.status == 'verify') {
                            if (setPinController.pinCodeChange.value == code) {
                              setPinController.onSetPINCode(
                                  setPinController.pinCodeChange.value,
                                  context);
                              LocalData.setPINCode("setPIN",
                                  customerController.customer.value.pinCode!);
                              await LocalData.getPINCode('setPIN');
                            } else {
                              customRouterSnackbar(
                                title: "Submit failed",
                                description:
                                    "PIN Code and Verify PIN Code are not match",
                                type: SnackType.error,
                              );
                            }
                          }
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
                  ],
                ),
              ),
            ),
            Obx(
              () => setPinController.isLoading.value
                  ? Container(
                      height: 100,
                      width: 100,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(1.0, 0.0),
                              blurRadius: 4,
                              color: Colors.black12)
                        ],
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
