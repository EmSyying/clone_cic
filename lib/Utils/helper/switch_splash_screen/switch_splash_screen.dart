import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_settings/controllers/appsetting_controller.dart';

class SwitchSplashScreen extends StatefulWidget {
  final Offset offset;
  const SwitchSplashScreen({Key? key, required this.offset}) : super(key: key);

  @override
  State<SwitchSplashScreen> createState() => _BooksState();
}

class _BooksState extends State<SwitchSplashScreen>
    with SingleTickerProviderStateMixin {
  final _settingCon = Get.put(SettingController());
  @override
  void initState() {
    _settingCon.fetchAppSetting(context: context, isSwitchSplashScreen: true);
    super.initState();
    _settingCon.animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      upperBound: 1.3,
    );

    _settingCon.animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _settingCon.animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _settingCon.animationController,
        child: Scaffold(
          backgroundColor: Colors.purple,
          body: Obx(() => _settingCon.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Container()),
        ),
        builder: (context, child) {
          // animationController.reverse().then((value) => Navigator.pop(context));
          return ClipPath(
            clipper: MyClipPath(
                value: _settingCon.animationController.value,
                offset: widget.offset),
            child: child,
          );
        });
  }
}

class MyClipPath extends CustomClipper<Path> {
  MyClipPath({this.value, this.offset});
  final double? value;
  final Offset? offset;
  @override
  Path getClip(Size size) {
    var path = Path();
    path.addOval(
      Rect.fromCircle(
        center: offset!,
        radius: value! * size.height,
      ),
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
