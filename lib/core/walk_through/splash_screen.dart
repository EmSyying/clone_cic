import 'package:cicgreenloan/main.dart';
import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:cicgreenloan/core/walk_through/start_slide.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/dashboard/buttom_navigation_bar.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  //save screen when first install
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with TickerProviderStateMixin {
  bool isLoading = true;
  bool isLogin = false;

  // final _userController = Get.put(CustomerController());
  final fifCon = Get.put(PriceController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultSizeWeb(
    //   child: Scaffold(
    //     body: SafeArea(
    //       child: Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             const Spacer(),
    //             Image.asset(
    //               'assets/images/Logo/cic.png',
    //               width: 200,
    //             ),
    //             const SizedBox(
    //               height: 20,
    //             ),
    //             Text(
    //               'Fast and Safe',
    //               style: TextStyle(
    //                   color: Theme.of(context).primaryColor,
    //                   fontFamily: 'DMSans',
    //                   letterSpacing: 2,
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 18),
    //             ),
    //             const Spacer(),
    //             const Text('Loading...'),
    //             const SizedBox(
    //               height: 50,
    //             ),
    //             if (isLoading)
    //               CircularProgressIndicator(
    //                 valueColor:
    //                     AlwaysStoppedAnimation(Theme.of(context).primaryColor),
    //               ),
    //             const SizedBox(
    //               height: 20,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return isLoginSuccess ? const PaymentSchedule() : const StartupSlide();
  }
}
