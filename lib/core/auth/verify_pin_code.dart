import 'dart:io';

import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Utils/helper/custom_appbar.dart';
import '../../Utils/helper/custom_route_snackbar.dart';
import '../../Utils/pin_code_controller/pin_code_controller.dart';

class VerifyPINCode extends StatefulWidget {
  final String? status;
  const VerifyPINCode({Key? key, this.status}) : super(key: key);
  @override
  State<VerifyPINCode> createState() => _VerifyPINCodeState();
}

class _VerifyPINCodeState extends State<VerifyPINCode> {
  final pinCodeController = Get.put(PINCodeController());
  final customerController = Get.put(CustomerController());
  String _pinCode = '1234';
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Logo/cic.png',
                      width: 200.0,
                    ),
                    Text(
                      widget.status == 'Current'
                          ? 'Current PIN Code'
                          : 'Verify PIN Code',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 25,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 35.0,
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
                        onCompleted: (code) async {
                          setState(() {
                            _pinCode = code;
                          });
                          if (customerController.customer.value.pinCode ==
                              _pinCode) {
                            if (widget.status == 'Current') {
                              context.go('/setting/verify-pin-code/setpincode');
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const SetPinCode(
                              //       status: 'set',
                              //     ),
                              //   ),
                              // );
                            } else {
                              context.go('/');
                              // Get.offAll(const PaymentSchedule());
                            }
                          } else {
                            customRouterSnackbar(
                              title: 'Submit Failed',
                              description: 'PIN Code are not match',
                              type: SnackType.error,
                            );
                          }
                        },
                        onChanged: (value) {},
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
              () => pinCodeController.isLoading.value
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
