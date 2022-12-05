import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:cicgreenloan/configs/route_configuration/route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';
import '../../modules/member_directory/controllers/customer_controller.dart';
import '../../utils/function/get_sharepreference_data.dart';
import '../../widgets/defualt_size_web.dart';
import '../app_settings/controllers/appsetting_controller.dart';
import '../pin_code_controller/set_pin_code_controller.dart';

final customerController = Get.put(CustomerController());
final _settingCon = Get.put(SettingController());
final setPINCodeController = Get.put(SetPINCodeController());

Timer timer = Timer(const Duration(minutes: 1), () {});
const timeout = Duration(minutes: 1);
const ms = Duration(milliseconds: 1);
void handleTimeout() async {
  customerController.isLoginSuccess(false);
  setPINCodeController.isLogin(false);
  setPINCodeController.update();
  timer.cancel();

  showLockScreen();
}

startTimeout([int? milliseconds]) {
  var duration = milliseconds == null ? timeout : ms * milliseconds;
  return Timer(duration, handleTimeout);
}

final LocalAuthentication auth = LocalAuthentication();
Future<bool> _authenticate() async {
  bool authenticated = false;
  if (!kIsWeb) {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    if (Platform.isAndroid) {
      if (availableBiometrics.contains(BiometricType.strong) ||
          availableBiometrics.contains(BiometricType.weak) ||
          availableBiometrics.contains(BiometricType.fingerprint)) {
        await LocalData.storeBiotricType('biotricType', 'fingerPrint');
      }
    } else {
      if (availableBiometrics.contains(BiometricType.face)) {
        await LocalData.storeBiotricType('biotricType', 'faceId');
      } else {
        await LocalData.storeBiotricType('biotricType', 'touchId');
      }
    }

    try {
      _settingCon.isAuthenticating.value = true;
      _settingCon.authorized.value = 'Authenticating';
      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
      );
      if (authenticated) {
        setPINCodeController.isLogin(true);
        isSuccess = true;
        Navigator.pop(Get.context!, true);
      } else {
        isSuccess = false;
        // Navigator.pop(Get.context!, false);
      }

      _settingCon.isAuthenticating.value = false;
      _settingCon.authorized.value = 'Authenticating';
    } on PlatformException catch (e) {
      debugPrint("$e");
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    _settingCon.authorized.value = message;
  }
  return authenticated;
}

// function for getting passcode input and submit code

void cancelAuthentication() {
  auth.stopAuthentication();
}

Future<bool> onShowFingerPrint() async {
  bool isAuthenticate = false;
  await LocalData.getAuthenValue('authen').then((value) async {
    if (value) {
      isAuthenticate = await _authenticate();
    }
  });
  return isAuthenticate;
}

String? storePasscode = customerController.customer.value.pinCode;
final StreamController<bool> _verificationNotifier =
    StreamController<bool>.broadcast();

bool isAuthenticated = false;

///call this function to show passcode screen
bool isSuccess = false;
Future<bool> showLockScreen(
    {String? routeName,
    bool enableCancel = false,
    BuildContext? context}) async {
  timer.cancel();
  isSuccess = await Navigator.push(
    context!,
    PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) {
          onShowFingerPrint();
          return DefaultSizeWeb(
            child: WillPopScope(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 20.0,
                    sigmaY: 20.0,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      PasscodeScreen(
                        cancelButton: const Text(""),
                        title: SvgPicture.asset(
                            'assets/images/svgfile/security_icon.svg'),
                        passwordEnteredCallback: (enteredPasscode) async {
                          bool isValid = storePasscode == enteredPasscode;

                          _verificationNotifier.add(isValid);
                          isSuccess = await setPINCodeController.submitPINCode(
                              context: context,
                              pinCode: enteredPasscode,
                              routeName: null);
                        },
                        deleteButton: const Text(
                          'Delete',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          semanticsLabel: 'Delete',
                        ),
                        shouldTriggerVerification: _verificationNotifier.stream,
                        backgroundColor: Colors.black54,
                        passwordDigits: 4,
                        keyboardUIConfig: KeyboardUIConfig(
                            digitFillColor:
                                const Color(0xffECF7FE).withAlpha(30)),
                      ),
                      if (routeName != null || enableCancel)
                        Positioned(
                            top: 50,
                            left: 20,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ))),
                      Obx(
                        () => setPINCodeController.isLoading.value
                            ? Material(
                                color: Colors.transparent,
                                child: Center(
                                  child: Container(
                                      padding: const EdgeInsets.all(30),
                                      decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black26,
                                              offset: Offset(1.0, 0.0),
                                              blurRadius: 6)
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      height: 100,
                                      width: 100,
                                      child: const CircularProgressIndicator()),
                                ),
                              )
                            : Container(),
                      ),
                      Obx(
                        () => setPINCodeController.isInvalidePin.value
                            ? Material(
                                color: Colors.transparent,
                                child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                              offset: Offset(1.0, 0.0),
                                              blurRadius: 6,
                                              color: Colors.black26)
                                        ]),
                                    height: 100,
                                    padding: const EdgeInsets.all(20),
                                    margin: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const Text(
                                            'Invalid PIN Code, Please retry.'),
                                        Row(
                                          children: [
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                setPINCodeController
                                                    .isInvalidePin
                                                    .value = false;
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20, top: 10),
                                                child: Text(
                                                  'OK',
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                              )
                            : Container(),
                      ),
                      Obx(
                        () => setPINCodeController.isblock.value
                            ? Material(
                                color: Colors.transparent,
                                child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                              offset: Offset(1.0, 0.0),
                                              blurRadius: 6,
                                              color: Colors.black26)
                                        ]),
                                    height: 140,
                                    padding: const EdgeInsets.all(20),
                                    margin: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                            'Your account was blocked, Please retry in 5 minutes later'),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 10.0),
                                          child: const Text(
                                              'Please contact to CiC team: 089 993 338'),
                                        ),
                                      ],
                                    )),
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
                onWillPop: () async => false),
          );
        }),
  );

  return isSuccess;
}
