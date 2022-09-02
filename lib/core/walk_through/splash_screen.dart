import 'dart:async';

import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/modules/google_map_module/controllers/google_map_controller.dart';
import 'package:cicgreenloan/core/walk_through/start_slide.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  //save screen when first install
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with TickerProviderStateMixin {
  bool isLoading = true;
  final _googleMapCon = Get.put(GoogleMapsController());

  // final _userController = Get.put(CustomerController());
  final fifCon = Get.put(PriceController());

  void onNavigator() async {
    await LocalData.getCurrentUser().then((value) {
      if (value != null) {
        Future.delayed(const Duration(seconds: 3), () {
          isLoading = false;
          setState(() {});
          context.go('/');
        });
      } else {
        Future.delayed(const Duration(seconds: 3), () {
          isLoading = false;
          setState(() {});
          context.go('/');
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const StartupSlide()));
        });
      }
    });
    try {
      await _googleMapCon.determinePosition().then((value) {
        _googleMapCon.latitute = value.latitude;
        _googleMapCon.longtitute = value.longitude;

        _googleMapCon.update();
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    onNavigator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultSizeWeb(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(
                  'assets/images/Logo/cic.png',
                  width: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Fast and Safe',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'DMSans',
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const Spacer(),
                const Text('Loading...'),
                const SizedBox(
                  height: 50,
                ),
                if (isLoading)
                  CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                  ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
