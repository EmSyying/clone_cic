// ignore_for_file: avoid_renaming_method_parameters

import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/Utils/function/set_current_user.dart';
import 'package:cicgreenloan/Utils/pop_up_alert/custom_loading.dart';
import 'package:cicgreenloan/modules/setting_modules/screens/sub_setting_screen/change_password.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../Utils/helper/color.dart';
import '../../Utils/helper/custom_appbar.dart';
import '../../Utils/helper/custom_route_snackbar.dart';

class VerifySetPassword extends StatefulWidget {
  final String? phone;
  final bool? isForgetPassword;
  const VerifySetPassword({Key? key, this.phone, this.isForgetPassword})
      : super(key: key);
  @override
  State<VerifySetPassword> createState() => _VerifySetPasswordState();
}

class _VerifySetPasswordState extends State<VerifySetPassword>
    with TickerProviderStateMixin {
  AnimationController? controller;

  String get timerString {
    Duration duration = controller!.duration! * controller!.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  String _otpCode = '1243';
  String token = '';
  bool _isLoading = false;
  bool _isVerifyLoading = false;

  onVerifyOtp() async {
    // getCurrentUser();
    var token = await LocalData.getCurrentUser();

    // var sharedPrefs = await SharedPreferences.getInstance();
    // var _userToken = '';
    String url = '${GlobalConfiguration().getValue('main_api_url')}verify-otp';
    setState(() {
      _isVerifyLoading = true;
    });
    // _isVerifyLoading == true ? showLoadingDialog(context) : Container();
    try {
      await http.post(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }, body: {
        'phone': widget.phone,
        'verify_code': _otpCode,
        'type': 'set_password',
      }).then((response) {
        if (response.statusCode == 200) {
          setState(() {
            _isVerifyLoading = false;
          });
          customRouterSnackbar(
            title: 'Verify OTP',
            description: 'Verify OTP Is Successfully!',
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangePassword(
                isForgetPassword: false,
              ),
            ),
          );
        } else {
          setState(() {
            _isVerifyLoading = false;
          });
          customRouterSnackbar(
            title: 'OTP is invalid',
            description: 'Please Try Again',
            type: SnackType.error,
          );
        }
      });
    } catch (e) {
      debugPrint("$e");
    } finally {
      setState(() {
        _isVerifyLoading = false;
      });
    }
    setState(() {
      _isVerifyLoading = false;
    });
  }

  requestOtpAgain() async {
    setState(() {
      _isLoading = true;
    });
    _isLoading ? showLoadingDialog(context) : null;

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
        Future.delayed(Duration.zero).then((_) {
          Navigator.of(context).pop();
        });
//        Navigator.pushReplacement(
//          context,
//          MaterialPageRoute(
//            builder: (context) => VerifySetPassword(
//              isForgetPassword: true,
//              phone: widget.phone,
//            ),
//          ),
//        );
      } else {
        _isLoading = false;
      }
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        _isLoading = !_isLoading;
      });
    }
  }

  onForgetPassword() async {
    logout();
    setState(() {
      _isVerifyLoading = true;
    });

    String url = '${GlobalConfiguration().getValue('main_api_url')}verify-otp';

    try {
      await http.post(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }, body: {
        'phone': widget.phone,
        'verify_code': _otpCode,
        'type': 'reset_password',
      }).then((response) {
        var userToken = json.decode(response.body)['access_token'];
        // print(userToken);

        setCurrentUser(userToken);
        if (response.statusCode == 200) {
          customRouterSnackbar(
            title: 'Verify OTP',
            description: 'Verify OTP Is Successful!',
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangePassword(
                isForgetPassword: true,
                phone: widget.phone!,
              ),
            ),
          );
        }
      });
    } catch (e) {
      customRouterSnackbar(
        title: 'OTP is invalid',
        description: 'Please Try Again',
        type: SnackType.error,
      );
    } finally {
      setState(() {
        _isVerifyLoading = false;
      });
    }
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('current_user');
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    );
    controller!.reverse(from: controller!.value = 1.0);
    super.initState();
  }

  @override
  void dispose() {
    if (controller != null) {
      controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultSizeWeb(
      child: Scaffold(
        appBar: CustomAppBar(
          context: context,
          title: 'Verify OTP',
          leading: IconButton(
            icon: Platform.isIOS
                ? Icon(
                    Icons.arrow_back_ios,
                    color: Get.theme.brightness == Brightness.light
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                  )
                : Icon(
                    Icons.arrow_back,
                    color: Get.theme.brightness == Brightness.light
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                  ),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        ),
        body: DefaultSizeWeb(
          child: Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
                height: double.infinity,
              ),
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/Logo/cic.png',
                        width: 100.0,
                      ),
                      AnimatedBuilder(
                          animation: controller!,
                          builder: (context, child) {
                            return controller!.isAnimating
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        left: 150.0, right: 150.0, top: 20.0),
                                    child: Align(
                                      alignment: FractionalOffset.center,
                                      child: AspectRatio(
                                        aspectRatio: 1.0,
                                        child: CustomPaint(
                                          painter: CustomTimerPainter(
                                            animation: controller,
                                            backgroundColor: Colors.white,
                                            color: AppColor.mainColor,
                                          ),
                                          child: Center(
                                            child: Text(
                                              timerString,
                                              style: const TextStyle(
                                                  fontSize: 18.0,
                                                  color: AppColor.mainColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink();
                          }),
                      const SizedBox(
                        height: 20.0,
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
                        'Code is Sent to ${widget.phone}',
                        style: Theme.of(context).textTheme.headline2,
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
                        //   onCodeChanged: (code) {
                        //     if (code!.length == 4) {
                        //       setState(() {
                        //         _otpCode = code;
                        //       });
                        //       widget.isForgetPassword!
                        //           ? onForgetPassword()
                        //           : onVerifyOtp();
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
                          onCompleted: (code) {
                            setState(() {
                              _otpCode = code;
                            });
                            widget.isForgetPassword!
                                ? onForgetPassword()
                                : onVerifyOtp();
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
                          AnimatedBuilder(
                              animation: controller!,
                              builder: (context, child) {
                                return GestureDetector(
                                  onTap: !controller!.isAnimating
                                      ? null
                                      : () {
                                          controller!.reverse(
                                              from: controller!.value = 1.0);
                                          requestOtpAgain();
                                        },
                                  child: Text(
                                    ' Request Again',
                                    style: TextStyle(
                                        color: controller!.isAnimating
                                            ? Colors.grey
                                            : Theme.of(context).primaryColor,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              })
                        ],
                      ),
                      const SizedBox(
                        height: 80.0,
                      ),
                    ],
                  ),
                ),
              ),
              _isVerifyLoading
                  ? Container(
                      color: Colors.transparent,
                      child: Center(
                        child: Container(
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
                            child: CircularProgressIndicator(
                              color: AppColor.mainColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double>? animation;
  final Color? backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor!
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color!;
    double progress = (1.0 - animation!.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation!.value != old.animation!.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
